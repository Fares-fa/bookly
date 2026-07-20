import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/onboarding/presentation/widgets/onboarding_spec.dart';

/// Per-page onboarding content: a two-line title (first line white, second
/// line accent-colored) followed by the page's illustration, centered in
/// the remaining space.
class OnboardingPageContent extends StatelessWidget {
  const OnboardingPageContent({super.key, required this.data});

  final OnboardingPageData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: OnboardingSpec.horizontalPadding.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSpacing.lg.h),
          Text(
            data.titleLine1,
            style: TextStyle(
              fontSize: OnboardingSpec.titleFontSize.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          Text(
            data.titleLine2,
            style: TextStyle(
              fontSize: OnboardingSpec.titleFontSize.sp,
              fontWeight: FontWeight.w700,
              color: OnboardingSpec.accent,
              height: 1.2,
            ),
          ),
          Expanded(child: Center(child: data.illustration)),
        ],
      ),
    );
  }
}
