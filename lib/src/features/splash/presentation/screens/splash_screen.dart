import 'dart:async';

import 'package:bookly/src/imports/imports.dart';

/// Layout and motion constants for [SplashScreen], grouped here so the
/// visual spec can be tweaked without hunting through the widget tree.
abstract final class _SplashSpec {
  _SplashSpec._();

  // ── Colors ─────────────────────────────────────────────────────────────
  static const Color background = Color(0xFFF0F4FA);
  static const Color subtitleColor = Color(0xFF5A6472);

  static const String subtitleText = 'One App Every Booking';
  static const double subtitleTopGap = 6;
  static const double subtitleFontSize = 16;
  static const Duration typingTickInterval = Duration(milliseconds: 40);

  static const double bottomOffset = 40;
  static const double poweredByLogoWidth = 70;
  static const double poweredBySlideOffset = 28;
  static const Duration poweredByDuration = Duration(milliseconds: 900);
  static const Duration poweredByStartDelay = Duration(milliseconds: 150);
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, this.onFinished});

  final VoidCallback? onFinished;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _logoController;
  late final AnimationController _poweredByController;

  late final Animation<double> _poweredByOpacity;
  late final Animation<double> _poweredByOffsetY;

  Timer? _subtitleTimer;
  int _subtitleRevealCount = 0;

  bool _subtitleSettled = false;
  bool _poweredBySettled = false;

  @override
  void initState() {
    super.initState();

    // Hand off from the native launch splash to this animated one as soon as
    // this screen has painted its first frame, rather than leaving the
    // native splash up until the session check resolves.
    WidgetsBinding.instance.addPostFrameCallback((_) => FlutterNativeSplash.remove());

    _logoController = AnimationController(vsync: this)
      ..addStatusListener(_onLogoStatusChanged);

    _poweredByController = AnimationController(
      vsync: this,
      duration: _SplashSpec.poweredByDuration,
    );
    final poweredByCurve = CurvedAnimation(parent: _poweredByController, curve: Curves.easeOut);
    _poweredByOpacity = poweredByCurve;
    _poweredByOffsetY = Tween<double>(
      begin: _SplashSpec.poweredBySlideOffset,
      end: 0,
    ).animate(poweredByCurve)
      ..addStatusListener(_onPoweredByStatusChanged);
  }

  void _onLogoStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _subtitleTimer = Timer.periodic(_SplashSpec.typingTickInterval, _onSubtitleTick);
    }
  }

  void _onSubtitleTick(Timer timer) {
    setState(() => _subtitleRevealCount++);
    if (_subtitleRevealCount >= _SplashSpec.subtitleText.length) {
      timer.cancel();
      _subtitleSettled = true;
      Future.delayed(_SplashSpec.poweredByStartDelay, () {
        if (mounted) _poweredByController.forward();
      });
      _maybeFinish();
    }
  }

  void _onPoweredByStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _poweredBySettled = true;
      _maybeFinish();
    }
  }

  void _maybeFinish() {
    if (_subtitleSettled && _poweredBySettled) {
      widget.onFinished?.call();
    }
  }

  @override
  void dispose() {
    _logoController.dispose();
    _poweredByController.dispose();
    _subtitleTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _SplashSpec.background,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  child: Lottie.asset(
                    AppAssets.booklyLettersLottie,
                    controller: _logoController,
                    fit: BoxFit.contain,
                    onLoaded: (composition) {
                      _logoController
                        ..duration = composition.duration
                        ..forward();
                    },
                  ),
                ),
                SizedBox(height: _SplashSpec.subtitleTopGap.h),
                AppReservedTypingText(
                  alignment: Alignment.center,
                  revealedCount: _subtitleRevealCount,
                  spans: [
                    TextSpan(
                      text: _SplashSpec.subtitleText,
                      style: TextStyle(
                        fontSize: _SplashSpec.subtitleFontSize.sp,
                        fontWeight: FontWeight.w500,
                        color: _SplashSpec.subtitleColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: _SplashSpec.bottomOffset.h,
            child: AnimatedBuilder(
              animation: _poweredByController,
              builder: (context, child) {
                return Opacity(
                  opacity: _poweredByOpacity.value,
                  child: Transform.translate(
                    offset: Offset(0, _poweredByOffsetY.value),
                    child: child,
                  ),
                );
              },
              child: SvgPicture.asset(
                AppAssets.poweredByZeds,
                width: _SplashSpec.poweredByLogoWidth.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
