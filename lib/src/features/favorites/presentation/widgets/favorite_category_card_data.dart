/// Data for a single [FavoriteCategoryCard].
class FavoriteCategoryCardData {
  const FavoriteCategoryCardData({
    required this.title,
    required this.countLabel,
    required this.images,
  });

  final String title;

  /// e.g. "12 Hotels" — kept as a plain label since each category pluralizes
  /// (or doesn't) differently in the design.
  final String countLabel;

  /// Exactly 4 photos for the 2x2 preview grid.
  final List<String> images;
}
