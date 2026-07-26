import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/booking/presentation/widgets/booking_card_data.dart';

export 'package:bookly/src/features/booking/presentation/widgets/booking_card_data.dart';

/// A single booking summary: thumbnail (with a category-icon badge), title,
/// dates, guests, location, and price.
///
/// Usage:
/// ```dart
/// BookingCard(data: booking, onTap: () => context.push('/bookings/${booking.id}'))
/// ```
class BookingCard extends StatelessWidget {
  const BookingCard({super.key, required this.data, this.onTap});

  final BookingCardData data;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    return AppCard(
      onTap: onTap,
      showShadow: true,
      padding: EdgeInsets.all(AppSpacing.sm.w),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 100.w,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CommonImage(
                      imageUrl: data.image,
                      fit: BoxFit.cover,
                      borderRadius: AppBorders.sm,
                    ),
                  ),
                  Positioned(
                    top: 6.h,
                    left: 6.w,
                    child: Container(
                      padding: EdgeInsets.all(3.w),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: AppBorders.xs,
                      ),
                      child: CommonImage(imageUrl: data.category.iconAsset, width: 16, height: 16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppSpacing.sm.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500, color: cs.onSurface),
                  ),
                  SizedBox(height: AppSpacing.xs.h),
                  Row(
                    children: [
                      Icon(Icons.calendar_month_outlined, size: 15.sp, color: cs.primary),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          data.dateRange,
                          style: TextStyle(fontSize: 12.sp, color: cs.onSurfaceVariant),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(Icons.person_outline, size: 15.sp, color: cs.onSurfaceVariant),
                      SizedBox(width: 4.w),
                      Text(
                        data.guestsLabel,
                        style: TextStyle(fontSize: 12.sp, color: cs.onSurfaceVariant),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.xs.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Icons.location_on_outlined, size: 15.sp, color: cs.onSurfaceVariant),
                            SizedBox(width: 4.w),
                            Flexible(
                              child: Text(
                                data.location,
                                style: TextStyle(fontSize: 12.sp, color: cs.onSurfaceVariant),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            data.price,
                            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: cs.primary),
                          ),
                          Text(
                            data.nightsLabel,
                            style: TextStyle(fontSize: 11.sp, color: cs.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ],
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
