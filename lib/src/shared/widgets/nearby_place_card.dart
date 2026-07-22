import '../../imports/imports.dart';

import 'package:bookly/src/features/home/domain/entities/nearby_place.dart';
import 'package:bookly/src/features/home/presentation/providers/home_providers.dart';

class NearbyPlaceCard extends ConsumerWidget {
  const NearbyPlaceCard({super.key, required this.place, required this.width});

  final NearbyPlace place;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;

    // Scoped with `.select` so toggling this heart repaints only this card,
    // never the rest of the list.
    final isFavorite = ref.watch(favoriteIdsProvider.select((ids) => ids.contains(place.id)));

    return MediaCardShell(
      imageAsset: place.imageAsset,
      width: width,
      imageHeight: 92.h,
      isFavorite: isFavorite,
      onFavoriteToggle: () => ref.read(favoriteIdsProvider.notifier).toggle(place.id),
      topLeftBadge: place.isOpen ? null : StatusBadge(label: 'Closed', color: cs.error),
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
            '${place.category} • ${place.distanceKm.toStringAsFixed(1)} km',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant,fontWeight: FontWeight.w400,fontSize: 13),
          ),
        ],
      ),
    );
  }
}