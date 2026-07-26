import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/booking/presentation/widgets/booking_details_data.dart';
import 'package:bookly/src/features/booking/presentation/widgets/summary_row.dart';

/// Sub total / fees / total amount breakdown on `BookingDetailsScreen`.
class PaymentSummary extends StatelessWidget {
  const PaymentSummary({super.key, required this.data});

  final BookingDetailsData data;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment summary',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: cs.onSurface),
        ),
        SizedBox(height: AppSpacing.sm.h),
        SummaryRow(label: 'Sub total', value: data.subtotal),
        SizedBox(height: AppSpacing.xs.h),
        SummaryRow(label: 'fees', value: data.fees),
        SizedBox(height: AppSpacing.sm.h),
        SummaryRow(label: 'Total amount', value: data.totalAmount, emphasize: true),
      ],
    );
  }
}
