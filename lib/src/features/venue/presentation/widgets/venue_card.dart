import 'package:bookly/src/imports/imports.dart';

/// Compact venue summary card (thumbnail + name + location + rating badge)
/// shown at the top of the Book-Table and Booking-Summary steps.
class VenueCard extends StatelessWidget {
  const VenueCard({
    super.key,
    required this.name,
    required this.location,
    required this.rating,
    required this.imageAsset,
  });

  final String name;
  final String location;
  final double rating;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorders.lg,
        boxShadow: AppShadows.subtle,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: AppBorders.md,
                  child: Image.asset(
                    imageAsset,
                    width: 72.w,
                    height: 60.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: AppSpacing.ms),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.blackW500Size18,
                      ),
                      SizedBox(height: AppSpacing.xs),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 16,
                            color: AppColors.textGray,
                          ),
                          SizedBox(width: AppSpacing.xxs),
                          Flexible(
                            child: Text(
                              location,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: AppColors.textGray,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.r),
                  bottomLeft: Radius.circular(16.r),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: AppColors.star, size: 16),
                  SizedBox(width: 4.w),
                  Text(
                    rating.toStringAsFixed(1),
                    style: AppTextStyle.whiteW500Size14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
