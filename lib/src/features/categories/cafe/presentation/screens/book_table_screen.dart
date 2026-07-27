import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/features/categories/cafe/domain/cafe_spec.dart';
import 'package:bookly/src/features/categories/cafe/presentation/providers/cafe_booking_flow_provider.dart';
import 'package:bookly/src/features/categories/venue/presentation/providers/booking_flow_state.dart';
import 'package:bookly/src/features/categories/venue/presentation/widgets/venue_widgets.dart';

import '../../../../../shared/body_apps/body_app.dart';

/// Step 1 of the cafe booking wizard: pick the reservation date and time.
class CafeBookTableScreen extends ConsumerWidget {
  const CafeBookTableScreen({super.key});

  Future<void> _openCalendar(BuildContext context, WidgetRef ref) async {
    final state = ref.read(cafeBookingFlowProvider);
    final result = await ReservationCalendarSheet.show(
      context,
      initialDate: state.date,
      initialTime: state.time,
    );
    if (result != null) {
      ref
          .read(cafeBookingFlowProvider.notifier)
          .setSchedule(result.date, result.time);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cafeBookingFlowProvider);

    return BodyApp(
      txtCustomAppBar:S.of(context).cafeBookTableTitle,
      onPressedArrowBack: () => context.pop(),
      bodyOfContent: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.ml),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VenueCard(
              name: cafeSpec.name,
              location: cafeSpec.location,
              rating: cafeSpec.rating,
              imageAsset: cafeSpec.cardImageAsset,
            ),
            SizedBox(height: AppSpacing.lg),
            Text(
              S.of(context).cafeSelectReservationTimeTitle,
              style: AppTextStyle.sectionTitle.copyWith(fontSize: 24.sp),
            ),
            SizedBox(height: AppSpacing.xs),
            Text(
              S.of(context).cafeReservationTimeHint,
              style: AppTextStyle.grey400Size14.copyWith(fontSize: 16.sp),
            ),
            SizedBox(height: AppSpacing.lg),
            _ScheduleRow(
              label: S.of(context).cafeDateLabel,
              value: state.date == null
                  ? S.of(context).cafeSelectDatePlaceholder
                  : formatBookingDate(state.date!),
              placeholder: state.date == null,
              onTap: () => _openCalendar(context, ref),
            ),
            SizedBox(height: AppSpacing.md),
            _ScheduleRow(
              label: S.of(context).cafeTimeLabel,
              value: state.time == null
                  ? S.of(context).cafeSelectTimePlaceholder
                  : formatBookingTime(state.time!),
              placeholder: state.time == null,
              onTap: () => _openCalendar(context, ref),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BookingBottomBar(
        stepIndex: 0,
        label: S.of(context).cafeContinueButton,
        menuRoute: AppRoutes.cafeMenu,
        menuIcon: Icons.local_cafe_outlined,
        enabled: state.hasSchedule,
        onContinue: () => context.push(AppRoutes.cafePartyDetails),
      ),
    );
  }
}

/// A "Date" / "Time" row — label on the left, tappable value on the right.
class _ScheduleRow extends StatelessWidget {
  const _ScheduleRow({
    required this.label,
    required this.value,
    required this.onTap,
    this.placeholder = false,
  });

  final String label;
  final String value;
  final VoidCallback onTap;
  final bool placeholder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          Text(label, style: AppTextStyle.blackW400Size16),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: placeholder ? AppColors.grey : AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
