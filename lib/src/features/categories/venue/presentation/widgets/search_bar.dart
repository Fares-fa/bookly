import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/imports/imports.dart';

class SearchBarBooking extends StatelessWidget {
  const SearchBarBooking({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;


    const pillBorder = OutlineInputBorder(
      borderRadius: AppBorders.full,
      borderSide: BorderSide.none,
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding, vertical: AppSpacing.md),
      child: Row(
        children: [
          Expanded(
            child: Theme(
              data: theme.copyWith(
                inputDecorationTheme: theme.inputDecorationTheme.copyWith(
                  fillColor: Colors.white,
                  border: pillBorder,
                  enabledBorder: pillBorder,
                  focusedBorder: pillBorder,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12.h),
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 22 / 14,
                    letterSpacing: 0,
                  ),
                ),
              ),
              child: AppTextField(
                hint: S.of(context).homeSearchHint,
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(12),
                  child: VectorGraphic(
                    loader: AssetBytesLoader(AppAssets.search),
                    width: 19,
                    height: 19,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: AppSpacing.sm),
          DecoratedBox(

            decoration: const BoxDecoration(image:DecorationImage(image:  AssetImage(AppAssets.map)), shape: BoxShape.circle,),
            child: Container(

              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: AppColors.scrim, shape: BoxShape.circle,),
              child: Column(
                children: [
                  const VectorGraphic(
                    loader: AssetBytesLoader(AppAssets.location),
                    width: 23,
                    height: 28,
                    colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                  ),
                  Text('Explore',style: AppTextStyle.whiteW400Size14.copyWith(fontSize: 11.sp),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}