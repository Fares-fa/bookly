import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/booking/presentation/widgets/booking_details_data.dart';

/// A single amenity chip (icon + label) shown inside `RoomDetailsCard`.
class AmenityChip extends StatelessWidget {
  const AmenityChip({super.key, required this.amenity});

  final BookingAmenity amenity;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.ms.w, vertical: 2.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: AppBorders.sm,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(amenity.icon, size: 14.sp, color: cs.onSurfaceVariant),
          SizedBox(width: 4.w),
          Text(amenity.label,
              style: TextStyle(fontSize: 12.sp, color: cs.onSurfaceVariant)),
        ],
      ),
    );
  }
}
