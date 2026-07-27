import 'package:bookly/src/imports/imports.dart';

/// Title + subtitle header for [MyBookingScreen].
class BookingHeader extends StatelessWidget {
  const BookingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).bookingMyBookingTitle,
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600, color: cs.onSurface),
        ),
        SizedBox(height: AppSpacing.xs.h),
        Text(
          S.of(context).bookingMyBookingSubtitle,
          style: TextStyle(fontSize: 12.sp, color: cs.onSurfaceVariant,fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
