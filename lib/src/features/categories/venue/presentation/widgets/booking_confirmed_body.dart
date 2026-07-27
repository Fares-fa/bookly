import 'dart:math';

import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/categories/venue/presentation/providers/booking_flow_state.dart';
import 'package:bookly/src/features/categories/venue/presentation/widgets/venue_widgets.dart';

/// Mock booking reference in the mockup's `255-421-448` shape.
///
/// Generate it once per confirmation screen (in `initState`) so it survives
/// rebuilds. Replace with the reference returned by the booking API.
String mockBookingId() {
  final rng = Random();
  String block() => rng.nextInt(1000).toString().padLeft(3, '0');
  return '${block()}-${block()}-${block()}';
}

/// The booking-confirmed layout: confetti + green tick, the reservation
/// reference card, the payment summary and the two exit CTAs.
///
/// Purely presentational — each venue's screen snapshots its own flow state and
/// passes the values in, so this stays shared.
class BookingConfirmedBody extends StatelessWidget {
  const BookingConfirmedBody({
    super.key,
    required this.bookingId,
    required this.date,
    required this.paymentMethod,
    required this.subTotal,
    required this.fees,
    required this.total,
    required this.onViewBooking,
    required this.onBackToHome,
    this.title,
    this.message,
  });

  final String bookingId;
  final DateTime? date;
  final PaymentMethod? paymentMethod;
  final String subTotal;
  final String fees;
  final String total;
  final VoidCallback onViewBooking;
  final VoidCallback onBackToHome;

  /// Falls back to the localized "Booking Confirmed" title when not provided.
  final String? title;

  /// Falls back to the localized confirmation message when not provided.
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const _SuccessHeader(),
                    Text(
                      title ?? S.of(context).venueBookingConfirmedTitle,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: AppSpacing.sm),
                    Text(
                      message ?? S.of(context).venueBookingConfirmedMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGray,
                      ),
                    ),
                    SizedBox(height: AppSpacing.lg),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.pagePadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _DetailsCard(
                            bookingId: bookingId,
                            date: date,
                            paymentMethod: paymentMethod,
                          ),
                          SizedBox(height: 16),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppSpacing.pagePadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).venuePaymentSummaryTitle,
                                  style: AppTextStyle.blackW500Size16,
                                ),
                                SizedBox(height:16),
                                PaymentSummary(
                                  subTotal: subTotal,
                                  fees: fees,
                                  total: total,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSpacing.lg),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                AppSpacing.pagePadding,
                AppSpacing.sm,
                AppSpacing.pagePadding,
                AppSpacing.md,
              ),
              child: Column(
                children: [
                  AppButton(
                    label: S.of(context).venueViewBookingDetailsButton,
                    isFullWidth: true,
                    customHeight: 56.h,
                    labelFontWeight: FontWeight.w600,
                    borderRadius: AppBorders.md,
                    onPressed: onViewBooking,
                  ),
                  SizedBox(height: AppSpacing.ms),
                  AppButton(
                    label: S.of(context).venueBackToHomeButton,
                    isFullWidth: true,
                    customHeight: 56.h,
                    color: AppColors.background,
                    textColor: AppColors.black,
                    labelFontWeight: FontWeight.w600,
                    borderRadius: AppBorders.md,
                    onPressed: onBackToHome,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Confetti banner with the green check badge sitting over it.
class _SuccessHeader extends StatelessWidget {
  const _SuccessHeader();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              AppAssets.celebration,
              height: 130.h,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(top: 60.h, child: const _CheckBadge()),
        ],
      ),
    );
  }
}

/// Rounded green tile with a filled circle and a white tick.
class _CheckBadge extends StatelessWidget {
  const _CheckBadge();

  @override
  Widget build(BuildContext context) {
    final green = context.appColors.green ?? context.appColors.success;

    return Container(
      width: 106.w,
      height: 106.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: green.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(34.r),
      ),
      child: Container(
        width: 76.w,
        height: 76.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [green, green.withValues(alpha: 0.82)],
          ),
        ),
        child: Icon(Icons.check_rounded, color: AppColors.white, size: 44.w),
      ),
    );
  }
}

/// Booking ID / date / payment-method card.
class _DetailsCard extends StatelessWidget {
  const _DetailsCard({
    required this.bookingId,
    required this.date,
    required this.paymentMethod,
  });

  final String bookingId;
  final DateTime? date;
  final PaymentMethod? paymentMethod;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: const BoxDecoration(
        color: AppColors.card,
        borderRadius: AppBorders.md,
      ),
      child: Column(
        children: [
          _row(
            S.of(context).venueBookingIdLabel,
            Text(bookingId, style: _valueStyle),
          ),
          _row(
            S.of(context).venueDateLabel,
            Text(
              date == null ? '—' : formatBookingFullDate(date!),
              style: _valueStyle,
            ),
          ),
          _row(
            S.of(context).venuePaymentMethodLabel,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (paymentMethod == PaymentMethod.applePay) ...[
                  const ApplePayMark(size: 24),
                  SizedBox(width: AppSpacing.sm),
                ],
                Text(_paymentMethodLabel(context), style: _valueStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Localized display text for [paymentMethod], independent of the enum's
  /// own (English-only) `label`.
  String _paymentMethodLabel(BuildContext context) {
    return switch (paymentMethod) {
      PaymentMethod.applePay => S.of(context).venuePaymentMethodApplePay,
      PaymentMethod.newCard => S.of(context).venuePaymentMethodNewCard,
      null => '—',
    };
  }

  static final TextStyle _valueStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  Widget _row(String label, Widget value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.greyConfirm,
            ),
          ),
          SizedBox(width: AppSpacing.md),
          Expanded(
            child: Align(alignment: Alignment.centerRight, child: value),
          ),
        ],
      ),
    );
  }
}
