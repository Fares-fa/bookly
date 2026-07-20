import 'package:bookly/src/imports/imports.dart';

/// The white phone mockup with the "Bookly." wordmark baked in — the
/// illustration for onboarding screen 1.
class PhoneIllustration extends StatelessWidget {
  const PhoneIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppAssets.firstOnboardingImage);
  }
}
