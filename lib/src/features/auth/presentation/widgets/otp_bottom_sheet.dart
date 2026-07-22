import 'dart:async';

import 'package:bookly/src/imports/core_imports.dart';
import 'package:bookly/src/imports/packages_imports.dart';

import 'package:bookly/src/shared/widgets/primary_button.dart';

/// Shows a modal bottom sheet prompting the user to enter a 4 digit OTP.
///
/// Returns the entered code when the user confirms, or `null` if dismissed.
Future<String?> showOtpBottomSheet(
  BuildContext context, {
  String? phoneNumber,
}) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Color(0xFFF0F8FF),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
    ),
    builder: (_) => _OtpBottomSheet(phoneNumber: phoneNumber),
  );
}

class _OtpBottomSheet extends StatefulWidget {
  const _OtpBottomSheet({this.phoneNumber});

  final String? phoneNumber;

  @override
  State<_OtpBottomSheet> createState() => _OtpBottomSheetState();
}

class _OtpBottomSheetState extends State<_OtpBottomSheet> {
  static const int _otpLength = 4;
  static const int _initialSeconds = 90; // 1:30 minutes

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  Timer? _timer;
  int _secondsLeft = _initialSeconds;
  String _code = '';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _secondsLeft = _initialSeconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft <= 1) {
        timer.cancel();
        setState(() => _secondsLeft = 0);
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  String get _formattedTime {
    final minutes = (_secondsLeft ~/ 60).toString().padLeft(2, '0');
    final seconds = (_secondsLeft % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;
    final isComplete = _code.length == _otpLength;
    final isExpired = _secondsLeft == 0;

    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.lg.w,
        right: AppSpacing.lg.w,
        // top: AppSpacing.lg.h,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.lg.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Center(
          //   child: Container(
          //     width: 40.w,
          //     height: 4.h,
          //     decoration: BoxDecoration(
          //       color: cs.outlineVariant,
          //       borderRadius: BorderRadius.circular(2.r),
          //     ),
          //   ),
          // ),
          // SizedBox(height: AppSpacing.lg.h),
          Text(
            textAlign: TextAlign.center,
            'Enter verification code',
            style: tt.headlineMedium?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: AppSpacing.sm.h),
          Text(
            widget.phoneNumber != null
                ? 'A 4 digit code was sent to ${widget.phoneNumber}.'
                : 'Enter the 4 digit code sent to your phone.',
            style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
          ),
          SizedBox(height: AppSpacing.xl.h),
          Center(
            child: Pinput(
              length: _otpLength,
              controller: _controller,
              focusNode: _focusNode,
              autofocus: true,
              separatorBuilder: (index) => SizedBox(
                width: 10.w,
              ),
              onChanged: (value) => setState(() => _code = value),
              defaultPinTheme: PinTheme(
                width: 42.w,
                height: 51.h,
                textStyle: tt.bodyLarge?.copyWith(
                  color: cs.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(color: cs.outline),
                ),
              ),
              focusedPinTheme: PinTheme(
                width: 42.w,
                height: 51.h,
                textStyle: tt.bodyLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 22.sp,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(color: cs.primary, width: 1.5),
                ),
              ),
            ),
          ),
          SizedBox(height: AppSpacing.lg.h),
          Center(
            child: isExpired
                ? TextButton(
                    onPressed: _startTimer,
                    child: Text(
                      'Resend code',
                      style: tt.labelLarge?.copyWith(
                        color: cs.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : Text(
                    'Resend code in $_formattedTime',
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
          ),
          SizedBox(height: AppSpacing.xl.h),
          PrimaryButton(
            label: 'Verify',
            isFullWidth: true,
            onPressed: isComplete && !isExpired
                ? () => GoRouter.of(context).pop(_code)
                : null,
          ),
          SizedBox(height: AppSpacing.sm.h),
        ],
      ),
    );
  }
}
