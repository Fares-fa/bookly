import 'package:bookly/src/imports/imports.dart';

/// Cover-photo header with a back button, screen title and the Bookly mark,
/// used at the top of the venue listing screens.
class VenueBookingHeader extends StatelessWidget {
  const VenueBookingHeader({
    super.key,
    required this.title,
    required this.imageAsset,
  });

  final String title;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(imageAsset, fit: BoxFit.cover),
        ),
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.scrimStrong, AppColors.scrimStrong],
              ),
            ),
          ),
        ),
        SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.pagePadding,
              AppSpacing.md,
              AppSpacing.pagePadding,
              AppSpacing.ml,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    width: 28.w,
                    height: 28.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.chevron_left_rounded,
                      color: Colors.black,
                      size: 24.w,
                    ),
                  ),
                ),
                SizedBox(width: AppSpacing.ms),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(AppAssets.smallBooklyIconTop, height: 28.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
