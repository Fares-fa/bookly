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
    required this.label,
    required this.icon,
    this.route,
    this.tinted = false,
    this.comingSoon = false,
  });

  final String id;
  final String label;

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
}

abstract final class HomeCategorySpec {
  HomeCategorySpec._();

  /// The 4 shortcuts shown in [HomeCategoryRow] on the home page.
  static const List<HomeCategoryData> categories = [
    HomeCategoryData(id: 'hotels', label: 'Hotels', icon: AppAssets.hotel),
    HomeCategoryData(id: 'cafe', label: 'Cafe', icon: AppAssets.cafe),
    HomeCategoryData(id: 'restaurant', label: 'Restaurant', icon: AppAssets.restaurant),
    HomeCategoryData(
      id: 'more',
      label: 'More',
      icon: AppAssets.more,
      route: AppRoutes.categories,
      tinted: true,
    ),
  ];

  /// The full category list shown in [CategoriesScreen].
  static const List<HomeCategoryData> allCategories = [
    HomeCategoryData(id: 'restaurant', label: 'Restaurant', icon: AppAssets.restaurant),
    HomeCategoryData(id: 'hotels', label: 'Hotels', icon: AppAssets.hotel),
    HomeCategoryData(id: 'cafe', label: 'Cafe', icon: AppAssets.cafe),
    HomeCategoryData(id: 'carRental', label: 'Car Rental', icon: AppAssets.carRental, comingSoon: true),
    HomeCategoryData(id: 'laboratory', label: 'laboratory', icon: AppAssets.laboratory, comingSoon: true),
    HomeCategoryData(id: 'flight', label: 'Flight', icon: AppAssets.flight, comingSoon: true),
  ];
}