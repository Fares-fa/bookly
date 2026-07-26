import '../../imports/imports.dart';

import 'package:bookly/src/features/home/domain/entities/nearby_place.dart';
import 'package:bookly/src/features/home/presentation/providers/home_providers.dart';

/// "Top Rated Places" card section. Defaults to Home's data, but [title],
/// [provider], and [onFilterTap] can all be overridden so other screens can
/// reuse the same section with different data.
class TopRatedSection extends StatelessWidget {
  const TopRatedSection({
    super.key,
    this.title = 'Top Rated Places',
    this.provider,
    this.onFilterTap,
    this.onPlaceTap,
  });

  final String title;
  final FutureProvider<List<NearbyPlace>>? provider;
  final VoidCallback? onFilterTap;

  /// Called with the tapped place; when null the cards aren't tappable.
  final void Function(NearbyPlace place)? onPlaceTap;

  @override
  Widget build(BuildContext context) {
    return AsyncCardSection<NearbyPlace>(
      title: title,
      provider: provider ?? nearbyPlacesProvider,
      emptyTitle: 'No nearby places found',
      errorMessage: 'Could not load nearby places',
      trailing: AppFilterChip(
        label: 'All',
        onTap: onFilterTap ?? () => context.showSnackBar('Filters coming soon'),
      ),
      itemBuilder: (context, place, width) => NearbyPlaceCard(
        place: place,
        width: width,
        onTap: onPlaceTap == null ? null : () => onPlaceTap!(place),
      ),
    );
  }
}