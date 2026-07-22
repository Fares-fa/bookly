import 'package:bookly/src/imports/imports.dart';

/// The rounded search pill in [HomeHeader].
///
/// Wraps the shared [AppTextField] rather than a raw [TextField] (keeps the
/// same validation/controller/testing surface as every other text field in
/// the app), with a local [Theme] override for the pill border radius and
/// white fill this header needs — no changes to the global input theme.
class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

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
              child: const AppTextField(
                hint: 'What are you looking for ?',
                prefixIcon: Padding(
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
          Container(
            width: 53,
            height: 53,
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: const Center(
              child: VectorGraphic(
                loader: AssetBytesLoader(AppAssets.gemini),
                width: 23,
                height: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}