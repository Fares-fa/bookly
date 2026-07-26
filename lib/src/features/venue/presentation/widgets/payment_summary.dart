import 'package:bookly/src/imports/imports.dart';

/// Sub total / fees / total rows.
///
/// Shared by the booking-summary step and the confirmation screen so the two
/// can't drift apart. The amounts come from the venue's spec until the pricing
/// API lands.
class PaymentSummary extends StatelessWidget {
  const PaymentSummary({
    super.key,
    required this.subTotal,
    required this.fees,
    required this.total,
  });

  final String subTotal;
  final String fees;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _row('Sub total', subTotal),
        SizedBox(height: AppSpacing.sm),
        _row('fees', fees),
        SizedBox(height: AppSpacing.md),
        _row('Total amount', total, emphasize: true),
      ],
    );
  }

  Widget _row(String label, String value, {bool emphasize = false}) {
    final style = TextStyle(
      fontSize: 16.sp,
      fontWeight: emphasize ? FontWeight.w600 : FontWeight.w400,
      color: emphasize ? AppColors.black : AppColors.textGray,
    );
    return Row(
      children: [
        Text(label, style: style),
        const Spacer(),
        Text(value, style: style),
      ],
    );
  }
}
