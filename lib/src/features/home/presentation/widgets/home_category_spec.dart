import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/imports/imports.dart';

/// Static quick-access category shown in [HomeCategoryRow] and the full
/// [CategoriesScreen] grid.
///
/// This is fixed UI navigation config, not fetched data, so — like
/// `OnboardingSpec.pages` — it's a plain `static const` list rather than a
/// Riverpod provider.
class HomeCategoryData {
  const HomeCategoryData({
    required this.id,
    required this.icon,
    this.route,
    this.tinted = false,
    this.comingSoon = false,
  });

  final String id;

  /// Asset path of the category's SVG illustration/icon.
  final String icon;

  /// Route to navigate to on tap; `null` means the category isn't wired up
  /// to a destination yet (a "coming soon" snackbar is shown instead).
  final String? route;

  /// Whether the icon tile uses the tinted (primary-container) background
  /// instead of the plain white one.
  final bool tinted;

  /// Whether this category is shown with a "Soon" ribbon and isn't tappable
  /// yet (used in the full [CategoriesScreen] grid).
  final bool comingSoon;

  /// The localized display label for this category.
  String label(BuildContext context) => switch (id) {
        'hotels' => S.of(context).homeCategoryHotels,
        'cafe' => S.of(context).homeCategoryCafe,
        'restaurant' => S.of(context).homeCategoryRestaurant,
        'more' => S.of(context).homeCategoryMore,
        'carRental' => S.of(context).homeCategoryCarRental,
        'laboratory' => S.of(context).homeCategoryLaboratory,
        'flight' => S.of(context).homeCategoryFlight,
        _ => id,
      };
}

abstract final class HomeCategorySpec {
  HomeCategorySpec._();

  /// The 4 shortcuts shown in [HomeCategoryRow] on the home page.
  static const List<HomeCategoryData> categories = [
    HomeCategoryData(id: 'hotels', icon: AppAssets.hotel),
    HomeCategoryData(
      id: 'cafe',
      icon: AppAssets.cafe,
      route: AppRoutes.bookingCafe,
    ),
    HomeCategoryData(
      id: 'restaurant',
      icon: AppAssets.restaurant,
      route: AppRoutes.bookingRestaurant,
    ),
    HomeCategoryData(
      id: 'more',
      icon: AppAssets.more,
      route: AppRoutes.categories,
      tinted: true,
    ),
  ];

  /// The full category list shown in [CategoriesScreen].
  static const List<HomeCategoryData> allCategories = [
    HomeCategoryData(
      id: 'restaurant',
      icon: AppAssets.restaurant,
      route: AppRoutes.bookingRestaurant,
    ),
    HomeCategoryData(id: 'hotels', icon: AppAssets.hotel),
    HomeCategoryData(
      id: 'cafe',
      icon: AppAssets.cafe,
      route: AppRoutes.bookingCafe,
    ),
    HomeCategoryData(id: 'carRental', icon: AppAssets.carRental, comingSoon: true),
    HomeCategoryData(id: 'laboratory', icon: AppAssets.laboratory, comingSoon: true),
    HomeCategoryData(id: 'flight', icon: AppAssets.flight, comingSoon: true),
  ];
}