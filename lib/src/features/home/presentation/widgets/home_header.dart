import 'package:bookly/src/imports/imports.dart';


/// The blue header used as the background of Home's pinned [SliverAppBar]:
/// wordmark + notification bell, search bar, and quick-category shortcuts.
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {


    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFF0042D3),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28.r),
          bottomRight: Radius.circular(28.r),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.pagePadding,
            AppSpacing.sm,
            AppSpacing.pagePadding,
            AppSpacing.sm,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  VectorGraphic(
                    loader: AssetBytesLoader(AppAssets.bookly),
                    width: 97.6,
                    height: 27.29,
                  ),
                  Spacer(),
                  _NotificationButton(),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationButton extends StatelessWidget {
  const _NotificationButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.showSnackBar('No new notifications'),
      child: const LiquidGlassLayer(
        settings: LiquidGlassSettings(
          lightAngle: 15,
          thickness: 20,
          blur: 10,
          glassColor: Color(0x20FFFFFF),
        ),
        child: LiquidGlass(
          shape: LiquidRoundedSuperellipse(
            borderRadius: 50,
          ),
          child: Padding(
          padding: EdgeInsets.all(12),
          child: VectorGraphic(
            loader: AssetBytesLoader(AppAssets.notification),
            width: 16.25,
            height: 18.57,
          ),
        ),
      ),
    ));
  }
}