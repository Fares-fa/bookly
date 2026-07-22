import 'package:bookly/src/imports/core_imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// "Reviews" tab: overall score badge and a list of user reviews.
class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'Review ', style: AppTextStyle.blackW500Size17),
                  TextSpan(text: '(20,052)', style: AppTextStyle.grey400Size14),
                ],
              ),
            ),
            const Spacer(),
            const _ScoreBadge(),
          ],
        ),
        const SizedBox(height: 8),
        const _Review(
          name: 'Mohamed el barawy',
          rating: '9.5',
          comment: 'Amazing the best in sharm el Shiekh',
        ),
        const Divider(height: 1, thickness: 1, color: AppColors.divider),
        const _Review(
          name: 'Ibrahim Fayek',
          rating: '9.5',
          comment: 'Amazing the best in sharm el Shiekh',
        ),
      ],
    );
  }
}

class _ScoreBadge extends StatelessWidget {
  const _ScoreBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.menuBg,
        borderRadius: BorderRadius.only(topRight: Radius.circular(18.r),bottomLeft:Radius.circular(18.r) ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star, color: AppColors.star, size: 18),
          const SizedBox(width: 6),
          Text('9.5',
              style: AppTextStyle.whiteW500Size14
                  .copyWith(color: AppColors.primary)),
          const SizedBox(width: 6),
          Text('Excellent',
              style: AppTextStyle.whiteW400Size14
                  .copyWith(color: AppColors.primary)),
        ],
      ),
    );
  }
}

class _Review extends StatelessWidget {
  final String name;
  final String rating;
  final String comment;
  const _Review({
    required this.name,
    required this.rating,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.menuBg,
                child: Icon(Icons.person, color: AppColors.primary),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppTextStyle.blackW400Size16),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.star, size: 16),
                      const SizedBox(width: 4),
                      Text(rating, style: AppTextStyle.blackW500Size14),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(comment, style: AppTextStyle.blackW400Size14),
        ],
      ),
    );
  }
}
