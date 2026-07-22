import 'package:bookly/src/imports/imports.dart';

class CompleteInfoHeader extends StatelessWidget {
  const CompleteInfoHeader({
    super.key,
    required this.step,
    this.showBackButton = false,
    this.onBack,
  });

  /// 0-indexed step out of 2 total steps.
  final int step;
  final bool showBackButton;

  /// Called when the back button is tapped. Defaults to popping the route.
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    final logoAndSteps = Column(spacing: 12, children: [
      SvgPicture.asset(AppAssets.smallBooklyIconBlue),
      Row(
          spacing: 4,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < 2; i++)
              AnimatedContainer(
                duration: Durations.short1,
                child: Container(
                  height: 8.h,
                  width: i == step ? 40.w : 15.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: i == step ? cs.primary : cs.outlineVariant),
                ),
              ),
          ]),
    ]);

    if (!showBackButton) {
      return logoAndSteps;
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 32,
            width: 32,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: cs.primary),
            child: Material(
              type: MaterialType.transparency,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: onBack ?? () => GoRouter.of(context).pop(),
                child: const Center(
                  child: Icon(Icons.arrow_back_ios_new,
                      size: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        logoAndSteps,
      ],
    );
  }
}
