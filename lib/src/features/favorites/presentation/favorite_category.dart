/// The favorites category being picked/viewed across the favorites feature.
enum FavoriteCategory {
  hotels,
  restaurants,
  cafes;

  /// The [FavoriteCategoryScreen] title for this category.
  String get screenTitle => switch (this) {
        FavoriteCategory.hotels => 'Favorite Hotels',
        FavoriteCategory.restaurants => 'Favorite Restaurant',
        FavoriteCategory.cafes => 'Favorite Cafes',
      };
}
