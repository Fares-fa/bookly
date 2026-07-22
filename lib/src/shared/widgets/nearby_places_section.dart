import '../../imports/imports.dart';

import 'package:bookly/src/features/home/domain/entities/nearby_place.dart';
import 'package:bookly/src/features/home/presentation/providers/home_providers.dart';

/// "Nearby Places" card section. Defaults to Home's data, but [title],
/// [provider], and [onFilterTap] can all be overridden so other screens can
/// reuse the same section with different data.
class NearbyPlacesSection extends StatelessWidget {
  const NearbyPlacesSection({
    super.key,
    this.title = 'Nearby Places',
    this.provider,
    this.onFilterTap,
  });

  final String title;
  final FutureProvider<List<NearbyPlace>>? provider;
  final VoidCallback? onFilterTap;

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
      itemBuilder: (context, place, width) => NearbyPlaceCard(place: place, width: width),
    );
  }
}