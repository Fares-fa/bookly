import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/favorites/presentation/widgets/hotel_card_data.dart';

/// The 3-photo gallery inside a [HotelCard]: a large left photo, and two
/// stacked photos on the right — the bottom one under a "+N more" scrim.
class HotelGallery extends StatelessWidget {
  const HotelGallery({super.key, required this.data});

  final HotelCardData data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: CommonImage(
              imageUrl: data.mainImage,
              fit: BoxFit.cover,
              borderRadius: AppBorders.sm,
            ),
          ),
          SizedBox(width: 6.w),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: CommonImage(
                    imageUrl: data.secondaryImage,
                    fit: BoxFit.cover,
                    borderRadius: AppBorders.sm,
                  ),
                ),
                SizedBox(height: 6.h),
                Expanded(
                  child: ClipRRect(
                    borderRadius: AppBorders.sm,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CommonImage(imageUrl: data.overlayImage, fit: BoxFit.cover),
                        Container(
                          color: Colors.black.withValues(alpha: 0.45),
                          alignment: Alignment.center,
                          child: Text(
                            '+${data.morePhotosCount}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ],
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
