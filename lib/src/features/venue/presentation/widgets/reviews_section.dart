import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/venue/domain/venue_spec.dart';

/// "Reviews" tab: overall score badge and a list of user reviews.
class VenueReviewsSection extends StatelessWidget {
  const VenueReviewsSection({
    super.key,
    required this.reviews,
    required this.rating,
    required this.ratingCount,
    required this.ratingLabel,
  });

  final List<VenueReview> reviews;
  final double rating;
  final String ratingCount;
  final String ratingLabel;

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
                  TextSpan(
                    text: 'Review ',
                    style: AppTextStyle.blackW500Size17,
                  ),
                  TextSpan(
                    text: ratingCount,
                    style: AppTextStyle.grey400Size14,
                  ),
                ],
              ),
            ),
            const Spacer(),
            _ScoreBadge(rating: rating, label: ratingLabel),
          ],
        ),
        const SizedBox(height: 8),
        for (var i = 0; i < reviews.length; i++) ...[
          if (i > 0)
            const Divider(height: 1, thickness: 1, color: AppColors.divider),
          _Review(review: reviews[i]),
        ],
      ],
    );
  }
}

class _ScoreBadge extends StatelessWidget {
  const _ScoreBadge({required this.rating, required this.label});

  final double rating;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.menuBg,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(18.r),
          bottomLeft: Radius.circular(18.r),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star, color: AppColors.star, size: 18),
          const SizedBox(width: 6),
          Text(
            rating.toStringAsFixed(1),
            style: AppTextStyle.whiteW500Size14
                .copyWith(color: AppColors.primary),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTextStyle.whiteW400Size14
                .copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}

class _Review extends StatelessWidget {
  const _Review({required this.review});

  final VenueReview review;

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
                  Text(review.name, style: AppTextStyle.blackW400Size16),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.star, size: 16),
                      const SizedBox(width: 4),
                      Text(review.rating,
                          style: AppTextStyle.blackW500Size14),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(review.comment, style: AppTextStyle.blackW400Size14),
        ],
      ),
    );
  }
}
