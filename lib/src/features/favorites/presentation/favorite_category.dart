import 'package:flutter/widgets.dart';

import 'package:bookly/generated/l10n.dart';

/// The favorites category being picked/viewed across the favorites feature.
enum FavoriteCategory {
  hotels,
  restaurants,
  cafes;

  /// The [FavoriteCategoryScreen] title for this category.
  String screenTitle(BuildContext context) => switch (this) {
        FavoriteCategory.hotels => S.of(context).favoritesHotelsScreenTitle,
        FavoriteCategory.restaurants =>
          S.of(context).favoritesRestaurantsScreenTitle,
        FavoriteCategory.cafes => S.of(context).favoritesCafesScreenTitle,
      };
}
