import 'package:bookly/src/utils/utils.dart';
import 'package:bookly/src/features/home/domain/entities/ad_banner.dart';
import 'package:bookly/src/features/home/domain/entities/nearby_place.dart';
import 'package:bookly/src/features/home/domain/entities/live_screening.dart';

abstract class HomeRepository {
  /// Active ad banners for the Home carousel.
  FutureEither<List<AdBanner>> getAdBanners();

  /// Places near the user's current location.
  FutureEither<List<NearbyPlace>> getNearbyPlaces();

  /// Upcoming live match screenings with available seats.
  FutureEither<List<LiveScreening>> getLiveScreenings();
}