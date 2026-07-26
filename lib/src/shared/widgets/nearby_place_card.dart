import 'package:bookly/generated/l10n.dart';

import '../../imports/imports.dart';

import 'package:bookly/src/features/home/domain/entities/nearby_place.dart';
import 'package:bookly/src/features/home/presentation/providers/home_providers.dart';

class NearbyPlaceCard extends ConsumerWidget {
  const NearbyPlaceCard({
    super.key,
    required this.place,
    required this.width,
    this.onTap,
  });

  final NearbyPlace place;
  final double width;

  /// Called when the card body is tapped. When null the card isn't tappable
  /// (the favorite heart keeps working regardless).
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;

    // Scoped with `.select` so toggling this heart repaints only this card,
    // never the rest of the list.
    final isFavorite = ref.watch(favoriteIdsProvider.select((ids) => ids.contains(place.id)));

    final card = MediaCardShell(
      imageAsset: place.imageAsset,
      width: width,
      imageHeight: 92.h,
      isFavorite: isFavorite,
      onFavoriteToggle: () => ref.read(favoriteIdsProvider.notifier).toggle(place.id),
      topLeftBadge: place.isOpen ? null : StatusBadge(label: S.of(context).commonExtraClosedLabel, color: cs.error),
      bottomRightBadge: RatingBadge(rating: place.rating),
      caption: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            place.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: tt.titleSmall?.copyWith(fontWeight: FontWeight.w500,fontSize: 14, color: cs.onSurface),
          ),
          SizedBox(height: AppSpacing.xxs),
          Text(
            S.of(context).commonExtraCategoryDistanceKm(
                place.category, place.distanceKm.toStringAsFixed(1)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant,fontWeight: FontWeight.w400,fontSize: 13),
          ),
        ],
      ),
    );

    if (onTap == null) return card;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: card,
    );
  }
}