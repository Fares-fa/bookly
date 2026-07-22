/// Data for a single [HotelCard].
class HotelCardData {
  const HotelCardData({
    required this.logoAsset,
    required this.name,
    required this.starRating,
    required this.mainImage,
    required this.secondaryImage,
    required this.overlayImage,
    required this.morePhotosCount,
    required this.score,
    required this.scoreLabel,
    required this.reviewCount,
    required this.location,
    required this.features,
  });

  final String logoAsset;
  final String name;
  final int starRating;

  /// The large left-hand gallery photo.
  final String mainImage;

  /// The top-right gallery photo.
  final String secondaryImage;

  /// The bottom-right gallery photo, shown under a "+[morePhotosCount]" scrim.
  final String overlayImage;
  final int morePhotosCount;

  final double score;
  final String scoreLabel;
  final int reviewCount;
  final String location;
  final List<String> features;
}
