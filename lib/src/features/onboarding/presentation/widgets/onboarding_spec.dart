import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/onboarding/presentation/widgets/phone_illustration.dart';
import 'package:bookly/src/features/onboarding/presentation/widgets/orbit_illustration.dart';

/// Visual + motion constants for [OnboardingScreen], grouped here so the
/// spec can be tweaked without hunting through the widget tree.
abstract final class OnboardingSpec {
  OnboardingSpec._();

  // ── Colors ─────────────────────────────────────────────────────────────
  static const Color background = Color(0xFF2843C8);
  static const Color accent = Color(0xFFE07E2E);

  // ── Layout ─────────────────────────────────────────────────────────────
  static const double horizontalPadding = 24;
  static const double titleFontSize = 25;

  // ── Top progress bars ────────────────────────────────────────────────────
  static const double progressBarHeight = 4;
  static const double progressBarGap = 6;
  static const Duration segmentDuration = Duration(seconds: 5);

  // ── Gap between the skip bar row and the "B." logo below it ────────────
  static const double logoTopGap = 8;

  static const List<OnboardingPageData> pages = [
    OnboardingPageData(
      titleLine1: 'Compare Choose',
      titleLine2: '& Book',
      illustration: PhoneIllustration(),
    ),
    OnboardingPageData(
      titleLine1: 'One App Endless',
      titleLine2: 'Bookings',
      illustration: OrbitIllustration(),
    ),
  ];
}

class OnboardingPageData {
  const OnboardingPageData({
    required this.titleLine1,
    required this.titleLine2,
    required this.illustration,
  });

  final String titleLine1;
  final String titleLine2;
  final Widget illustration;
}
