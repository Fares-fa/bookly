import 'package:bookly/src/imports/core_imports.dart';
import 'package:bookly/src/imports/packages_imports.dart';

import 'package:bookly/src/features/home/domain/entities/ad_banner.dart';
import 'package:bookly/src/features/home/domain/entities/nearby_place.dart';
import 'package:bookly/src/features/home/domain/entities/live_screening.dart';
import 'package:bookly/src/features/home/domain/repositories/home_repository.dart';
import 'package:bookly/src/features/home/data/datasources/home_local_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource _dataSource;

  const HomeRepositoryImpl({HomeLocalDataSource dataSource = const HomeLocalDataSource()})
      : _dataSource = dataSource;

  @override
  FutureEither<List<AdBanner>> getAdBanners() async {
    try {
      return right(await _dataSource.fetchAdBanners());
    } catch (e) {
      return left(UnknownFailure('Failed to load ads', error: e));
    }
  }

  @override
  FutureEither<List<NearbyPlace>> getNearbyPlaces() async {
    try {
      return right(await _dataSource.fetchNearbyPlaces());
    } catch (e) {
      return left(UnknownFailure('Failed to load nearby places', error: e));
    }
  }

  @override
  FutureEither<List<LiveScreening>> getLiveScreenings() async {
    try {
      return right(await _dataSource.fetchLiveScreenings());
    } catch (e) {
      return left(UnknownFailure('Failed to load live screenings', error: e));
    }
  }
}