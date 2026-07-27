import 'package:bookly/src/imports/imports.dart';

/// Cover-photo header with a back button, screen title and the Bookly mark,
/// used at the top of the venue listing screens.
class VenueBookingHeader extends StatelessWidget {
  const VenueBookingHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  child: const VectorGraphic(
                    loader: AssetBytesLoader(AppAssets.back),

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
                VectorGraphic(loader: const AssetBytesLoader(AppAssets.smallBooklyIconTop), height: 22.h),
              ],
            ),
          ),


    );
  }
}
