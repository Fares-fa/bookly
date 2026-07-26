import 'package:bookly/generated/l10n.dart';

import '../../imports/imports.dart';

import 'package:bookly/src/features/home/domain/entities/nearby_place.dart';
import 'package:bookly/src/features/home/presentation/providers/home_providers.dart';

/// "Nearby Places" card section. Defaults to Home's data, but [title],
/// [provider], and [onFilterTap] can all be overridden so other screens can
/// reuse the same section with different data.
class NearbyPlacesSection extends StatelessWidget {
  const NearbyPlacesSection({
    super.key,
    this.title,
    this.provider,
    this.onFilterTap,
    this.onPlaceTap,
  });

  final String? title;
  final FutureProvider<List<NearbyPlace>>? provider;
  final VoidCallback? onFilterTap;

  /// Called with the tapped place; when null the cards aren't tappable.
  final void Function(NearbyPlace place)? onPlaceTap;

  @override
  Widget build(BuildContext context) {
    return AsyncCardSection<NearbyPlace>(
      title: title ?? S.of(context).commonExtraNearbyPlacesTitle,
      provider: provider ?? nearbyPlacesProvider,
      emptyTitle: S.of(context).commonExtraNoNearbyPlacesFound,
      errorMessage: S.of(context).commonExtraCouldNotLoadNearbyPlaces,
      trailing: AppFilterChip(
        label: S.of(context).commonExtraAllFilterLabel,
        onTap: onFilterTap ?? () => context.showSnackBar(S.of(context).commonExtraFiltersComingSoonMessage),
      ),
      itemBuilder: (context, place, width) => NearbyPlaceCard(
        place: place,
        width: width,
        onTap: onPlaceTap == null ? null : () => onPlaceTap!(place),
      ),
    );
  }
}