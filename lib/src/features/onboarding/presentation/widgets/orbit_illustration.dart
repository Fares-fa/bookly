import 'package:bookly/src/imports/imports.dart';

/// The orbiting icon constellation with the "B." logo centered on top — the
/// illustration for onboarding screen 2.
class OrbitIllustration extends StatelessWidget {
  const OrbitIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    // Give the orbit its full screen width to render at (ignoring the page's
    // side padding) so the outer ring of icons has room and doesn't clip.
    final screenWidth = MediaQuery.sizeOf(context).width;
    return OverflowBox(
      maxWidth: screenWidth,
      maxHeight: screenWidth,
      child: SizedBox(
        width: screenWidth,
        height: screenWidth,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Lottie.asset(AppAssets.onboardingOrbitLottie, repeat: true, fit: BoxFit.contain),
            SvgPicture.asset(AppAssets.middleBooklyIcon),
          ],
        ),
      ),
    );
  }
}
