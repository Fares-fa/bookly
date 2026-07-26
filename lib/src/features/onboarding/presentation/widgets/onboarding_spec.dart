import 'package:bookly/src/imports/imports.dart';
import 'package:bookly/generated/l10n.dart';

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

  /// Number of onboarding pages — safe to use without a [BuildContext] (e.g.
  /// for sizing the segmented progress bar).
  static const int pageCount = 2;

  /// Localized onboarding page content. Needs a [BuildContext] because the
  /// titles are translated strings.
  static List<OnboardingPageData> pages(BuildContext context) => [
        OnboardingPageData(
          titleLine1: S.of(context).onboardingPage1TitleLine1,
          titleLine2: S.of(context).onboardingPage1TitleLine2,
          illustration: const PhoneIllustration(),
        ),
        OnboardingPageData(
          titleLine1: S.of(context).onboardingPage2TitleLine1,
          titleLine2: S.of(context).onboardingPage2TitleLine2,
          illustration: const OrbitIllustration(),
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
