import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/home/domain/entities/ad_banner.dart';
import 'package:bookly/src/features/home/domain/entities/nearby_place.dart';
import 'package:bookly/src/features/home/domain/entities/live_screening.dart';
import 'package:bookly/src/features/home/domain/repositories/home_repository.dart';
import 'package:bookly/src/features/home/data/repositories/home_repository_impl.dart';

/// Provides the HomeRepository instance.
final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return const HomeRepositoryImpl();
});

/// Active ad banners for the Home carousel.
final adBannersProvider = FutureProvider<List<AdBanner>>((ref) async {
  final result = await ref.watch(homeRepositoryProvider).getAdBanners();
  return result.fold((failure) => throw failure, (banners) => banners);
});

/// Places near the user's current location.
final nearbyPlacesProvider = FutureProvider<List<NearbyPlace>>((ref) async {
  final result = await ref.watch(homeRepositoryProvider).getNearbyPlaces();
  return result.fold((failure) => throw failure, (places) => places);
});

/// Upcoming live match screenings with available seats.
final liveScreeningsProvider = FutureProvider<List<LiveScreening>>((ref) async {
  final result = await ref.watch(homeRepositoryProvider).getLiveScreenings();
  return result.fold((failure) => throw failure, (screenings) => screenings);
});

/// Ids of places/screenings the user has favorited.
///
/// Kept as a plain set of ids (rather than mutating list entities in place)
/// so toggling one favorite never triggers a refetch or a full-list rebuild:
/// each card watches `favoriteIdsProvider.select((ids) => ids.contains(id))`
/// and only that card's heart icon repaints.
final favoriteIdsProvider = StateNotifierProvider<FavoriteIdsController, Set<String>>((ref) {
  return FavoriteIdsController();
});

class FavoriteIdsController extends StateNotifier<Set<String>> {
  FavoriteIdsController() : super(const <String>{});

  void toggle(String id) {
    final next = {...state};
    if (!next.remove(id)) {
      next.add(id);
    }
    state = next;
  }
}