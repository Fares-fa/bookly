import 'package:bookly/src/imports/imports.dart';

/// "Policy" tab: deposit, opening/closing hours and a call action.
class VenuePolicySection extends StatelessWidget {
  const VenuePolicySection({
    super.key,
    required this.deposit,
    required this.openingAt,
    required this.closedAt,
    required this.phone,
  });

  final String deposit;
  final String openingAt;
  final String closedAt;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Policy', style: AppTextStyle.blackW500Size17),
        const SizedBox(height: 18),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Deposite Need : ',
                style: AppTextStyle.blackW500Size14,
              ),
              TextSpan(
                text: deposit,
                style: AppTextStyle.blackW500Size14
                    .copyWith(color: AppColors.primary),
              ),
              TextSpan(
                text: '/Person',
                style: AppTextStyle.blackW500Size14
                    .copyWith(color: AppColors.primary, fontSize: 12.sp),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        _HoursRow(label: 'Opening at', value: openingAt),
        const SizedBox(height: 18),
        _HoursRow(label: 'Closed at', value: closedAt),
        const SizedBox(height: 22),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              const Icon(Icons.call, color: AppColors.primary, size: 22),
              const SizedBox(width: 12),
              Text(
                'Call $phone',
                style: AppTextStyle.whiteW500Size16
                    .copyWith(color: AppColors.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HoursRow extends StatelessWidget {
  const _HoursRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.calendar_month_outlined,
            color: AppColors.primary, size: 22),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: AppTextStyle.blackW400Size12),
            const SizedBox(height: 2),
            Text(value, style: AppTextStyle.blackW400Size12),
          ],
        ),
      ],
    );
  }
}
