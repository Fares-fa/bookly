import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/restaurant/domain/restaurant_spec.dart';
import 'package:bookly/src/features/restaurant/presentation/providers/booking_flow_provider.dart';
import 'package:bookly/src/features/venue/presentation/providers/booking_flow_state.dart';
import 'package:bookly/src/features/venue/presentation/widgets/venue_widgets.dart';

/// Step 1 of the booking wizard: pick the reservation date and time.
///
/// Tapping either the Date or Time row opens the [ReservationCalendarSheet];
/// "Continue" is enabled once both are set and advances to party details.
class BookTableScreen extends ConsumerWidget {
  const BookTableScreen({super.key});

  Future<void> _openCalendar(BuildContext context, WidgetRef ref) async {
    final state = ref.read(bookingFlowProvider);
    final result = await ReservationCalendarSheet.show(
      context,
      initialDate: state.date,
      initialTime: state.time,
    );
    if (result != null) {
      ref
          .read(bookingFlowProvider.notifier)
          .setSchedule(result.date, result.time);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bookingFlowProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: BookingAppBar(title: S.of(context).restaurantBookTableTitle),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.ml),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VenueCard(
              name: restaurantSpec.name,
              location: restaurantSpec.location,
              rating: restaurantSpec.rating,
              imageAsset: restaurantSpec.cardImageAsset,
            ),
            SizedBox(height: AppSpacing.lg),
            Text(
              S.of(context).restaurantSelectReservationTimeTitle,
              style: AppTextStyle.sectionTitle.copyWith(fontSize: 24.sp),
            ),
            SizedBox(height: AppSpacing.xs),
            Text(
              S.of(context).restaurantReservationTimeHint,
              style: AppTextStyle.grey400Size14.copyWith(fontSize: 16.sp),
            ),
            SizedBox(height: AppSpacing.lg),
            _ScheduleRow(
              label: S.of(context).restaurantDateLabel,
              value: state.date == null
                  ? S.of(context).restaurantSelectDatePlaceholder
                  : formatBookingDate(state.date!),
              placeholder: state.date == null,
              onTap: () => _openCalendar(context, ref),
            ),
            SizedBox(height: AppSpacing.md),
            _ScheduleRow(
              label: S.of(context).restaurantTimeLabel,
              value: state.time == null
                  ? S.of(context).restaurantSelectTimePlaceholder
                  : formatBookingTime(state.time!),
              placeholder: state.time == null,
              onTap: () => _openCalendar(context, ref),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BookingBottomBar(
        stepIndex: 0,
        label: S.of(context).restaurantContinueLabel,
        menuRoute: AppRoutes.restaurantMenu,
        enabled: state.hasSchedule,
        onContinue: () => context.push(AppRoutes.partyDetails),
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
