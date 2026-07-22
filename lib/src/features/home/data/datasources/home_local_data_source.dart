import 'package:bookly/src/features/home/domain/entities/ad_banner.dart';
import 'package:bookly/src/features/home/domain/entities/nearby_place.dart';
import 'package:bookly/src/features/home/domain/entities/live_screening.dart';
import 'package:bookly/src/shared/app_assets.dart';

/// Local, in-memory stand-in for a future remote Home data source.
///
/// Every method has the same shape a Dio-backed implementation would have
/// (`Future<List<Entity>>`), so [HomeRepositoryImpl] can swap this out for a
/// `HomeRemoteDataSource` later without touching the domain or presentation
/// layers.
class HomeLocalDataSource {
  const HomeLocalDataSource();

  Future<List<AdBanner>> fetchAdBanners() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return const [
      AdBanner(
        id: 'ad-hotels',
        title: 'Enjoy Up to',
        highlight: '30% OFF',
        subtitle: 'On Hotels',
        ctaLabel: 'Explore Now',
        imageAsset: AppAssets.ad,
      ),
      AdBanner(
        id: 'ad-restaurants',
        title: 'Save Big',
        highlight: '20% OFF',
        subtitle: 'On Restaurants',
        ctaLabel: 'Explore Now',
        imageAsset: AppAssets.ad,
      ),
      AdBanner(
        id: 'ad-cafes',
        title: 'Limited Time',
        highlight: '15% OFF',
        subtitle: 'On Cafes',
        ctaLabel: 'Explore Now',
        imageAsset: AppAssets.ad,
      ),
    ];
  }

  Future<List<NearbyPlace>> fetchNearbyPlaces() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return const [
      NearbyPlace(
        id: 'place-gado-cafe',
        name: 'Gado Cafe',
        category: 'Cafe',
        imageAsset: AppAssets.rest,
        rating: 4.5,
        distanceKm: 0.5,
        isOpen: true,
      ),
      NearbyPlace(
        id: 'place-hilton-hotel',
        name: 'Hilton Hotel',
        category: 'Hotel',
        imageAsset: AppAssets.hilton,
        rating: 4.5,
        distanceKm: 0.6,
        isOpen: true,
      ),
      NearbyPlace(
        id: 'place-rivera-cafe',
        name: 'Rivera Cafe',
        category: 'Cafe',
        imageAsset: AppAssets.cafeImage,
        rating: 4.2,
        distanceKm: 0.8,
        isOpen: false,
      ),
    ];
  }

  Future<List<LiveScreening>> fetchLiveScreenings() async {
    await Future<void>.delayed(const Duration(milliseconds: 450));
    return const [
      LiveScreening(
        id: 'screening-final',
        title: 'Champions',
        category: 'Cafe',
        distanceKm: 0.8,
        price: 100,
        imageAsset: AppAssets.hilton,
        seatsLeft: 8,
      ),
      LiveScreening(
        id: 'screening-derby',
        title: 'Derby',
        category: 'Cafe',
        distanceKm: 0.8,
        price: 100,
        imageAsset: AppAssets.rest,
        seatsLeft: 5,
      ),
      LiveScreening(
        id: 'screening-classic',
        title: 'Classic',
        imageAsset: AppAssets.cafeImage,
        category: 'Cafe',
        distanceKm: 0.8,
        price: 100,
        seatsLeft: 8,
      ),
    ];
  }
}