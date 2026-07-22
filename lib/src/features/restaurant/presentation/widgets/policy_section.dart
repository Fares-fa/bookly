import 'package:bookly/src/imports/core_imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// "Policy" tab: deposit, opening/closing hours and a call action.
class PolicySection extends StatelessWidget {
  const PolicySection({super.key});

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
                text: '150EGP',
                style: AppTextStyle.blackW500Size14
                    .copyWith(color: AppColors.primary),
              ),
              TextSpan(
                text: '/Person',
                style: AppTextStyle.blackW500Size14
                    .copyWith(color: AppColors.primary,fontSize: 12.sp),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        const _HoursRow(label: 'Opening at', value: '09:00 PM'),
        const SizedBox(height: 18),
        const _HoursRow(label: 'Closed at', value: '12:00 AM'),
        const SizedBox(height: 22),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              const Icon(Icons.call, color: AppColors.primary, size: 22),
              const SizedBox(width: 12),
              Text(
                'Call 1999',
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
  final String label;
  final String value;
  const _HoursRow({required this.label, required this.value});

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
