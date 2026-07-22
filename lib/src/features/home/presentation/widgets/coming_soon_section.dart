import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/home/presentation/widgets/horizontal_card_list.dart';

class _ComingSoonItem {
  const _ComingSoonItem(
      {required this.title, required this.subtitle, required this.imageAsset});

  final String title;
  final String subtitle;
  final String imageAsset;
}

const List<_ComingSoonItem> _comingSoonItems = [
  _ComingSoonItem(
    title: 'Surprise me',
    subtitle: 'Smart picks based on your history',
    imageAsset: AppAssets.soonOne,
  ),
  _ComingSoonItem(
    title: 'Mood Booking',
    subtitle: 'Recommendations based on your mood',
    imageAsset: AppAssets.soonTwo,
  ),
  _ComingSoonItem(
    title: 'Voice Booking',
    subtitle: 'Recommendations based on your mood',
    imageAsset: AppAssets.soonThree,
  ),
];

const double _cardWidth = 175;
const double _cardImageHeight = 100;
const double _listHeight = 142;

/// Static teaser strip for upcoming features, shown at the end of the Home
/// page. Unlike the other sections, this data is fixed UI copy — not fetched
/// — so it's a plain [StatelessWidget] with no provider.
class ComingSoonSection extends StatelessWidget {
  const ComingSoonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.pagePadding, vertical: AppSpacing.sm),
          child: GradientText(
            'Coming Soon',
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
          itemCount: _comingSoonItems.length,
          itemExtent: _cardWidth.w + AppSpacing.sm,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(right: AppSpacing.sm),
            child: _ComingSoonCard(item: _comingSoonItems[index]),
          ),
        ),
      ],
    );
  }
}

class _ComingSoonCard extends StatelessWidget {
  const _ComingSoonCard({required this.item});

  final _ComingSoonItem item;

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
