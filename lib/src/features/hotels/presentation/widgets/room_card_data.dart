import 'package:bookly/src/shared/app_assets.dart';

/// A selectable rate option for a room, e.g. "All inclusive" or
/// "Breakfast included", each with its own price.
class RoomPackage {
  const RoomPackage({required this.name, required this.price});

  final String name;
  final String price;
}

/// Data for a single [RoomCard].
class RoomCardData {
  const RoomCardData({
    required this.images,
    required this.description,
    required this.features,
    required this.price,
    required this.numberOfNights,
    this.packages = const [],
  });

  /// All photos of this room; the first is used as the card thumbnail.
  final List<String> images;

  /// e.g. "Standard, Double, Sea view".
  final String description;

  /// e.g. ['Wifi', 'Tv', 'Air Conditioning'].
  final List<String> features;
  final String price;
  final int numberOfNights;

  /// Rate/package options the user can choose between, e.g. All inclusive,
  /// Breakfast included. Shown when the card is expanded.
  final List<RoomPackage> packages;
}

// TODO: Replace with real data from a rooms repository/provider once one
// exists, keyed by hotel.
const placeholderRooms = <RoomCardData>[
  RoomCardData(
    images: [
      AppAssets.favouritesHotel,
      AppAssets.rest1,
      AppAssets.rest2,
      AppAssets.rest3,
    ],
    description: 'Standard, Double, Sea view',
    features: [
      'Wifi',
      'Tv',
      'Air Conditioning',
      'Wifi',
      'Tv',
      'Air Conditioning',
      'Wifi',
    ],
    price: 'EGP 12,300',
    numberOfNights: 5,
    packages: [
      RoomPackage(name: 'Room only', price: 'EGP 12,300'),
      RoomPackage(name: 'Breakfast included', price: 'EGP 13,800'),
      RoomPackage(name: 'All inclusive', price: 'EGP 17,200'),
    ],
  ),
  RoomCardData(
    images: [AppAssets.rest2, AppAssets.rest1, AppAssets.favouritesHotel],
    description: 'Deluxe, Twin, City view',
    features: [
      'Wifi',
      'Tv',
      'Wifi',
      'Tv',
    ],
    price: 'EGP 15,750',
    numberOfNights: 5,
    packages: [
      RoomPackage(name: 'Room only', price: 'EGP 15,750'),
      RoomPackage(name: 'Breakfast included', price: 'EGP 17,400'),
      RoomPackage(name: 'All inclusive', price: 'EGP 21,000'),
    ],
  ),
  RoomCardData(
    images: [AppAssets.rest3, AppAssets.favouritesHotel, AppAssets.rest1],
    description: 'Suite, King, Sea view',
    features: ['Wifi', 'Tv', 'Air Conditioning'],
    price: 'EGP 22,000',
    numberOfNights: 5,
    packages: [
      RoomPackage(name: 'Room only', price: 'EGP 22,000'),
      RoomPackage(name: 'Breakfast included', price: 'EGP 24,100'),
      RoomPackage(name: 'All inclusive', price: 'EGP 29,500'),
    ],
  ),
];
