import 'dart:async';

import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/features/booking/presentation/widgets/booking_details_data.dart';
import 'package:bookly/src/features/booking/presentation/widgets/hotel_stay_card.dart';
import 'package:bookly/src/features/booking/presentation/widgets/room_details_card.dart';
import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/categories/venue/presentation/widgets/venue_widgets.dart';

import '../../../venue/presentation/providers/booking_flow_state.dart';
import '../../domain/restaurant_spec.dart';
import '../providers/booking_flow_provider.dart';

/// Step 3 of the booking wizard: review the reservation, apply a promo code,
/// pick a payment method and confirm. "Confirm & pay" unlocks once a payment
/// method is selected.
class BookingSummaryScreen extends ConsumerStatefulWidget {
  const BookingSummaryScreen({super.key, this.hotelData});
  final BookingDetailsData? hotelData;

  @override
  ConsumerState<BookingSummaryScreen> createState() =>
      _BookingSummaryScreenState();
}

class _BookingSummaryScreenState extends ConsumerState<BookingSummaryScreen> {
  final _promoController = TextEditingController();

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  /// Replaces this step with the confirmation screen, which owns clearing the
  /// flow — so the wizard can't be reached again with the back gesture.
  void _confirm() => context.pushReplacement(AppRoutes.bookingConfirmed);

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bookingFlowProvider);
    final notifier = ref.read(bookingFlowProvider.notifier);

    return BodyApp(
      txtCustomAppBar: S.of(context).restaurantBookingSummaryTitle,
      onPressedArrowBack: () => context.pop(),
      bodyOfContent: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _HoldBanner(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSpacing.md),
                  if (widget.hotelData != null) ...[
                    HotelStayCard(data: widget.hotelData!),
                    SizedBox(height: AppSpacing.md.h),
                    RoomDetailsCard(data: widget.hotelData!),
                    SizedBox(height: AppSpacing.lg.h),
                  ],
                  if (widget.hotelData == null) ...[
                    VenueCard(
                      name: restaurantSpec.name,
                      location: restaurantSpec.location,
                      rating: restaurantSpec.rating,
                      imageAsset: restaurantSpec.cardImageAsset,
                    ),
                    SizedBox(height: AppSpacing.md),
                    _SummaryCard(
                      state: state,
                      remaining: restaurantSpec.remaining,
                    ),
                  ],
                  SizedBox(height: AppSpacing.lg),
                  _sectionTitle(S.of(context).restaurantAddPromoCodeTitle),
                  SizedBox(height: AppSpacing.xxs),
                  Text(
                    S.of(context).restaurantPromoCodeSubtitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: AppSpacing.md),
                  _PromoField(controller: _promoController),
                  SizedBox(height: AppSpacing.lg),
                  _sectionTitle(
                      S.of(context).restaurantSelectPaymentMethodTitle),
                  SizedBox(height: AppSpacing.md),
                  _PaymentTile(
                    leading: const ApplePayMark(),
                    label: PaymentMethod.applePay.label,
                    selected: state.paymentMethod == PaymentMethod.applePay,
                    onTap: () => notifier.selectPayment(PaymentMethod.applePay),
                  ),
                  SizedBox(height: AppSpacing.ms),
                  _PaymentTile(
                    leading: const Icon(
                      Icons.add_circle_outline,
                      size: 28,
                      color: AppColors.textDark,
                    ),
                    label: S.of(context).restaurantAddNewCardLabel,
                    selected: state.paymentMethod == PaymentMethod.newCard,
                    onTap: () => notifier.selectPayment(PaymentMethod.newCard),
                  ),
                  SizedBox(height: AppSpacing.lg),
                  _sectionTitle(S.of(context).restaurantPaymentSummaryTitle),
                  SizedBox(height: AppSpacing.md),
                  PaymentSummary(
                    subTotal: restaurantSpec.subTotal,
                    fees: restaurantSpec.fees,
                    total: restaurantSpec.total,
                  ),
                  SizedBox(height: AppSpacing.md),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BookingBottomBar(
        hideMenuButton: widget.hotelData != null,
        stepIndex: 2,
        label: S.of(context).restaurantConfirmAndPayLabel,
        menuRoute: AppRoutes.restaurantMenu,
        enabled: state.paymentMethod != null,
        onContinue: _confirm,
      ),
    );
  }

  Widget _sectionTitle(String text) =>
      Text(text, style: AppTextStyle.blackW500Size16);
}

/// Blue banner with a live countdown for how long the reservation is held.
class _HoldBanner extends StatefulWidget {
  const _HoldBanner();

  @override
  State<_HoldBanner> createState() => _HoldBannerState();
}

class _HoldBannerState extends State<_HoldBanner> {
  static const _holdDuration = Duration(minutes: 30);
  Timer? _timer;
  Duration _remaining = _holdDuration;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remaining.inSeconds <= 0) {
        _timer?.cancel();
        return;
      }
      setState(() => _remaining -= const Duration(seconds: 1));
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formatted {
    final minutes = _remaining.inMinutes.toString().padLeft(2, '0');
    final seconds = (_remaining.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primary.withValues(alpha: 0.18),
      padding: EdgeInsets.symmetric(vertical: AppSpacing.ms),
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
          text: '${S.of(context).restaurantHoldReservationMessage} ',
          style: AppTextStyle.blackW400Size14,
          children: [
            TextSpan(
              text: _formatted,
              style: AppTextStyle.blackW500Size14
                  .copyWith(color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}

/// White card listing the reservation details (person, option, note, balance).
class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.state, required this.remaining});

  final BookingFlowState state;
  final String remaining;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorders.lg,
        boxShadow: AppShadows.subtle,
      ),
      child: Column(
        children: [
          _row(
            S.of(context).restaurantPersonLabel,
            S.of(context).restaurantPartySizeValue(state.partySize.toString()),
          ),
          _row(S.of(context).restaurantOptionLabel, state.option?.label ?? '—'),
          _row(
            S.of(context).restaurantNoteLabel,
            state.note.isEmpty
                ? S.of(context).restaurantAddNoteText
                : state.note,
            isNote: true,
          ),
          _row(S.of(context).restaurantRemainingMoneyLabel, remaining,
              emphasize: true),
        ],
      ),
    );
  }

  Widget _row(
    String label,
    String value, {
    bool isNote = false,
    bool emphasize = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.ms),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textGray,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: AppSpacing.md),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (isNote) ...[
                  const Icon(Icons.edit, size: 15, color: AppColors.primary),
                  SizedBox(width: AppSpacing.xs),
                ],
                Flexible(
                  child: Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: emphasize ? FontWeight.w500 : FontWeight.w400,
                      color: isNote ? AppColors.primary : AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PromoField extends StatelessWidget {
  const _PromoField({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: AppSpacing.md, right: AppSpacing.xs),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorders.md,
        boxShadow: AppShadows.subtle,
      ),
      child: Row(
        children: [
          const Icon(Icons.confirmation_number_outlined,
              size: 18, color: AppColors.textGray),
          SizedBox(width: AppSpacing.sm),
          Expanded(
            child: TextField(
              controller: controller,
              style: AppTextStyle.blackW400Size14,
              cursorColor: AppColors.primary,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                fillColor: AppColors.white,
                border: InputBorder.none,
                hintText: S.of(context).restaurantPromoCodeHint,
                hintStyle:
                    TextStyle(fontSize: 14.sp, color: AppColors.textGray),
              ),
            ),
          ),
          AppButton(
            label: S.of(context).restaurantApplyLabel,
            customHeight: 26.h,
            contentPadding: EdgeInsets.symmetric(horizontal: AppSpacing.ml),
            borderRadius: AppBorders.full,
            onPressed: () => context
                .showSnackBar(S.of(context).restaurantPromoCodeAppliedMessage),
          ),
        ],
      ),
    );
  }
}

class _PaymentTile extends StatelessWidget {
  const _PaymentTile({
    required this.leading,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final Widget leading;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: AppBorders.md,
          boxShadow: AppShadows.subtle,
        ),
        child: Row(
          children: [
            leading,
            SizedBox(width: AppSpacing.md),
            Text(label, style: AppTextStyle.blackW400Size16),
            const Spacer(),
            _Radio(selected: selected),
          ],
        ),
      ),
    );
  }
}

class _Radio extends StatelessWidget {
  const _Radio({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22.w,
      height: 22.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? AppColors.primary : AppColors.textGray,
          width: 2,
        ),
      ),
      child: selected
          ? Center(
              child: Container(
                width: 12.w,
                height: 12.w,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
            )
          : null,
    );
  }
}
