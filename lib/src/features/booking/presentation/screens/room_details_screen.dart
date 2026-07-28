import 'package:bookly/src/features/favorites/presentation/widgets/hotel_gallery.dart';
import 'package:bookly/src/features/hotels/presentation/widgets/room_gallery_viewer.dart';
import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/booking/presentation/widgets/booking_details_data.dart';
import 'package:bookly/src/features/booking/presentation/widgets/amenity_chip.dart';

/// Full-screen view of a room's type, amenities, and inclusions, reached by
/// tapping the [RoomDetailsCard] on the summary/details screens.
class RoomDetailsScreen extends StatelessWidget {
  const RoomDetailsScreen({super.key, required this.data});

  final BookingDetailsData data;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final successColor = context.theme.extension<AppColorsExtension>()!.success;

    return BodyApp(
      txtCustomAppBar: S.of(context).roomDetailsTitle,
      onPressedArrowBack: () => context.pop(),
      bodyOfContent: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.md.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () =>
                  RoomGalleryViewer.show(context, images: data.roomImages!),
              child: ClipRRect(
                borderRadius: AppBorders.md,
                child: SizedBox(
                  // width: 120,
                  height: 210,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CommonImage(
                        imageUrl: data.roomImages!.first,
                        fit: BoxFit.cover,
                      ),
                      if (data.roomImages!.length > 1)
                        Positioned(
                          right: 4,
                          bottom: 4,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.w, vertical: 2.h),
                            decoration: const BoxDecoration(
                              color: AppColors.scrimStrong,
                              borderRadius: AppBorders.sm,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.photo_library,
                                    size: 12.sp, color: AppColors.white),
                                SizedBox(width: 2.w),
                                Text(
                                  '${data.roomImages!.length}',
                                  style: AppTextStyle.whiteW400Size14
                                      .copyWith(fontSize: 11.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 2.h),
                          decoration: const BoxDecoration(
                            color: AppColors.scrimStrong,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(60),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star,
                                  size: 12.sp, color: AppColors.star),
                              SizedBox(width: 2.w),
                              Text(
                                '4.5',
                                style: AppTextStyle.whiteW400Size14
                                    .copyWith(fontSize: 11.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppSpacing.ms,
            ),
            Text(
              data.roomType,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: cs.onSurface,
              ),
            ),
            Text(
              data.hotelName,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: cs.outline,
              ),
            ),
            Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.star_rounded, color: Colors.amber, size: 12.sp),
              const SizedBox(
                width: 4,
              ),
              Text('${data.starRating}',
                  style: AppTextStyle.blackW400Size12
                      .copyWith(fontWeight: FontWeight.w600)),
              SizedBox(width: AppSpacing.xs.w),
              Text('(320 Reviews)',
                  style: AppTextStyle.blackW400Size12
                      .copyWith(fontWeight: FontWeight.w300)),
            ]),
            SizedBox(height: AppSpacing.md.h),
            Text('Amenities',
                style: AppTextStyle.blackW400Size16
                    .copyWith(fontWeight: FontWeight.w600)),
            SizedBox(height: AppSpacing.xs.h),
            Wrap(
              spacing: AppSpacing.sm.w,
              runSpacing: AppSpacing.sm.h,
              children: [
                for (final amenity in data.amenities)
                  AmenityChip(amenity: amenity),
              ],
            ),
            SizedBox(height: AppSpacing.md.h),
            Text('Description',
                style: AppTextStyle.blackW400Size16
                    .copyWith(fontWeight: FontWeight.w600)),
            SizedBox(height: AppSpacing.xs.h),
            Text('Wow this is a very nice room',
                style: AppTextStyle.grey400Size14
                    .copyWith(fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
