import 'package:equatable/equatable.dart';

/// A nearby bookable place (cafe, hotel, restaurant, ...) shown on Home.
class NearbyPlace extends Equatable {
  final String id;
  final String name;
  final String category;
  final String imageAsset;
  final double rating;
  final double distanceKm;
  final bool isOpen;

  const NearbyPlace({
    required this.id,
    required this.name,
    required this.category,
    required this.imageAsset,
    required this.rating,
    required this.distanceKm,
    required this.isOpen,
  });

  @override
  List<Object?> get props => [id, name, category, imageAsset, rating, distanceKm, isOpen];
}