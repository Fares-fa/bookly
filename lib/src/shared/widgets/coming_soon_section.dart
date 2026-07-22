import '../../imports/imports.dart';

class ComingSoonItem {
  const ComingSoonItem(
      {required this.title, required this.subtitle, required this.imageAsset});

  final String title;
  final String subtitle;
  final String imageAsset;
}

const List<ComingSoonItem> _defaultComingSoonItems = [
  ComingSoonItem(
    title: 'Surprise me',
    subtitle: 'Smart picks based on your history',
    imageAsset: AppAssets.soonOne,
  ),
  ComingSoonItem(
    title: 'Mood Booking',
    subtitle: 'Recommendations based on your mood',
    imageAsset: AppAssets.soonTwo,
  ),
  ComingSoonItem(
    title: 'Voice Booking',
    subtitle: 'Recommendations based on your mood',
    imageAsset: AppAssets.soonThree,
  ),
];

const double _cardWidth = 175;
const double _cardImageHeight = 100;
const double _listHeight = 142;

/// Static teaser strip for upcoming features. [title] and [items] default to
/// Home's copy, but both can be overridden so other screens can reuse this
/// section with their own teaser content.
class ComingSoonSection extends StatelessWidget {
  const ComingSoonSection({
    super.key,
    this.title = 'Coming Soon',
    this.items = _defaultComingSoonItems,
  });

  final String title;
  final List<ComingSoonItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.pagePadding, vertical: AppSpacing.sm),
          child: GradientText(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            gradientDirection: GradientDirection.tltbr,
            colors: const [
              Color(0xFF2563EB),
              Color(0xFFF97316),
            ],
          ),
        ),
        HorizontalCardList(
          height: _listHeight.h,
          itemCount: items.length,
          itemExtent: _cardWidth.w + AppSpacing.sm,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(right: AppSpacing.sm),
            child: _ComingSoonCard(item: items[index]),
          ),
        ),
      ],
    );
  }
}

class _ComingSoonCard extends StatelessWidget {
  const _ComingSoonCard({required this.item});

  final ComingSoonItem item;

  @override
  Widget build(BuildContext context) {
    final tt = context.theme.textTheme;
    final cs = context.theme.colorScheme;

    return SizedBox(
      width: _cardWidth.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: AppBorders.card,
            child: Stack(
              children: [
                Image.asset(item.imageAsset,
                    width: _cardWidth.w,
                    height: _cardImageHeight.h,
                    fit: BoxFit.cover),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.75),
                          Colors.black.withValues(alpha: 0)
                        ],
                        stops: const [0.0, 0.6],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: AppSpacing.sm,
                  right: AppSpacing.sm,
                  bottom: AppSpacing.sm,
                  child: Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSpacing.sm),
          Text(
            item.subtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}