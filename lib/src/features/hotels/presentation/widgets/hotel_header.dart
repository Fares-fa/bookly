import 'package:bookly/src/imports/imports.dart';

class HotelHeader extends StatelessWidget {
  const HotelHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = context.theme.textTheme;
    return DecoratedBox(
      decoration: BoxDecoration(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                spacing: 10,
                children: [
                  _BackButton(),
                  Text('Booking Hotels',
                      style: tt.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 20)),
                  Spacer(),
                  SvgPicture.asset(AppAssets.smallBooklyIconTop)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => GoRouter.of(context).pop(),
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
                child: Icon(Icons.arrow_back_ios_new, color: Colors.white)),
          ),
        ));
  }
}
