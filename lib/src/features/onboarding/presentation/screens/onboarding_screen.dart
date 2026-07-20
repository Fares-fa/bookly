import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/onboarding/presentation/widgets/onboarding_spec.dart';
import 'package:bookly/src/features/onboarding/presentation/widgets/onboarding_page_content.dart';

/// Story-style onboarding flow (Instagram/Snapchat-story style): a [PageView]
/// with a row of segmented timer bars at the top. Each segment fills over
/// [OnboardingSpec.segmentDuration], then auto-advances to the next page;
/// manual swipes re-sync the timer to whichever page the user lands on.
///
/// Self-contained — drop it straight into the router. [onFinished] fires
/// when the last segment finishes, "Skip" is tapped, or "Get Started" is
/// tapped. [onGuest] fires from "Join as a Guest" (defaults to [onFinished]
/// when not provided).
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, required this.onFinished, this.onGuest});

  final VoidCallback onFinished;
  final VoidCallback? onGuest;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with SingleTickerProviderStateMixin {
  late final PageController _pageController;
  late final AnimationController _progressController;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _progressController = AnimationController(
      vsync: this,
      duration: OnboardingSpec.segmentDuration,
    )..addStatusListener(_onSegmentStatusChanged);
    _progressController.forward();
  }

  void _onSegmentStatusChanged(AnimationStatus status) {
    if (status != AnimationStatus.completed) return;

    if (_currentPage >= OnboardingSpec.pages.length - 1) {
      widget.onFinished();
      return;
    }
    _pageController.animateToPage(
      _currentPage + 1,
      duration: AppDurations.pageTransition,
      curve: AppCurves.pageEnter,
    );
  }

  void _onPageChanged(int index) {
    setState(() => _currentPage = index);
    _progressController
      ..reset()
      ..forward();
  }

  void _pauseTimer() => _progressController.stop();

  void _resumeTimer() {
    if (!_progressController.isCompleted) _progressController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const pages = OnboardingSpec.pages;

    return Scaffold(
      backgroundColor: OnboardingSpec.background,
      body: SafeArea(
        child: GestureDetector(
          onLongPressStart: (_) => _pauseTimer(),
          onLongPressEnd: (_) => _resumeTimer(),
          onLongPressCancel: _resumeTimer,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  OnboardingSpec.horizontalPadding.w,
                  AppSpacing.md.h,
                  OnboardingSpec.horizontalPadding.w,
                  0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: AnimatedBuilder(
                        animation: _progressController,
                        builder: (context, _) => AppSegmentedProgressBar(
                          segmentCount: pages.length,
                          currentIndex: _currentPage,
                          progress: _progressController.value,
                          height: OnboardingSpec.progressBarHeight,
                          gap: OnboardingSpec.progressBarGap,
                          fillColor: OnboardingSpec.accent,
                        ),
                      ),
                    ),
                    SizedBox(width: AppSpacing.sm.w),
                    GestureDetector(
                      onTap: widget.onFinished,
                      child: Text(
                        'Skip',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  OnboardingSpec.horizontalPadding.w,
                  OnboardingSpec.logoTopGap.h,
                  OnboardingSpec.horizontalPadding.w,
                  0,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset(AppAssets.smallBooklyIconTop),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: pages.length,
                  onPageChanged: _onPageChanged,
                  itemBuilder: (context, index) => OnboardingPageContent(data: pages[index]),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  OnboardingSpec.horizontalPadding.w,
                  0,
                  OnboardingSpec.horizontalPadding.w,
                  AppSpacing.lg.h,
                ),
                child: Column(
                  children: [
                    AppButton(
                      label: 'Get Started',
                      onPressed: widget.onFinished,
                      color: OnboardingSpec.accent,
                      textColor: Colors.white,
                      isFullWidth: true,
                      height: ButtonSize.medium,
                      borderRadius: AppBorders.full,
                    ),
                    SizedBox(height: AppSpacing.md.h),
                    GestureDetector(
                      onTap: widget.onGuest ?? widget.onFinished,
                      child: Text(
                        'Join as a Guest',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
