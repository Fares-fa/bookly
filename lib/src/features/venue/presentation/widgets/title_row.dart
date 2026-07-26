import 'package:bookly/src/imports/imports.dart';

/// Venue name with a primary-colored rating badge on the right.
class VenueTitleRow extends StatelessWidget {
  const VenueTitleRow({super.key, required this.name, required this.rating});

  final String name;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(name, style: AppTextStyle.blackW500Size18),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(18.r),
              bottomLeft: Radius.circular(18.r),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star, color: AppColors.star, size: 18),
              SizedBox(width: 8.w),
              Text(
                rating.toStringAsFixed(1),
                style: AppTextStyle.whiteW500Size14,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
