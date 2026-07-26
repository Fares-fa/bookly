import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/booking/presentation/widgets/booking_details_data.dart';
import 'package:bookly/src/features/booking/presentation/widgets/amenity_chip.dart';

/// Room type, amenities, and inclusions card on `BookingDetailsScreen`.
class RoomDetailsCard extends StatelessWidget {
  const RoomDetailsCard({super.key, required this.data});

  final BookingDetailsData data;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final successColor = context.theme.extension<AppColorsExtension>()!.success;

    return AppCard(
      showShadow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  data.roomType,
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400, color: cs.onSurface),
                ),
              ),
              Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
            ],
          ),
          SizedBox(height: AppSpacing.sm.h),
          Wrap(
            spacing: AppSpacing.sm.w,
            runSpacing: AppSpacing.sm.h,
            children: [
              for (final amenity in data.amenities) AmenityChip(amenity: amenity),
            ],
          ),
          SizedBox(height: AppSpacing.sm.h),
          for (final inclusion in data.inclusions)
            Padding(
              padding: EdgeInsets.only(top: AppSpacing.xs.h),
              child: Row(
                children: [
                  Icon(Icons.check, size: 16.sp, color: successColor),
                  SizedBox(width: 4.w),
                  Text(
                    inclusion,
                    style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: successColor),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
