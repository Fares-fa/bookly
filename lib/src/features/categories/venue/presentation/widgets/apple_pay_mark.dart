import 'package:bookly/src/imports/imports.dart';

/// Small black Apple-Pay roundel, used in the payment-method tile on the
/// booking-summary step and again on the confirmation screen.
class ApplePayMark extends StatelessWidget {
  const ApplePayMark({super.key, this.size = 28});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.w,
      height: size.w,
      decoration: const BoxDecoration(
        color: AppColors.black,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.apple, color: AppColors.white, size: size * 0.64),
    );
  }
}
