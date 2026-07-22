import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/favorites/presentation/favorite_category.dart';
import 'package:bookly/src/features/favorites/presentation/widgets/favorite_category_card.dart';

// TODO: Replace with real counts/photos from a favorites repository/provider
// once one exists. All image slots reuse the same placeholder for now.
const _categories = <(FavoriteCategory, FavoriteCategoryCardData)>[
  (
    FavoriteCategory.hotels,
    FavoriteCategoryCardData(
      title: 'Hotels',
      countLabel: '12 Hotels',
      images: [
        AppAssets.favouritesHotel,
        AppAssets.favouritesHotel,
        AppAssets.favouritesHotel,
        AppAssets.favouritesHotel,
      ],
    ),
  ),
  (
    FavoriteCategory.restaurants,
    FavoriteCategoryCardData(
      title: 'Restaurant',
      countLabel: '12 Restaurant',
      images: [
        AppAssets.favouritesHotel,
        AppAssets.favouritesHotel,
        AppAssets.favouritesHotel,
        AppAssets.favouritesHotel,
      ],
    ),
  ),
  (
    FavoriteCategory.cafes,
    FavoriteCategoryCardData(
      title: 'Cafes',
      countLabel: '12 Cafe',
      images: [
        AppAssets.favouritesHotel,
        AppAssets.favouritesHotel,
        AppAssets.favouritesHotel,
        AppAssets.favouritesHotel,
      ],
    ),
  ),
];

/// Favorites category picker — routes to the matching favorites list
/// (hotels/restaurants/cafes) based on whichever tile the user taps.
class MyFavoritesScreen extends StatelessWidget {
  const MyFavoritesScreen({super.key});

  void _onCategoryTap(BuildContext context, FavoriteCategory category) {
    context.push(AppRoutes.favoriteCategory, extra: category);
  }

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md.w, vertical: AppSpacing.md.h),
              child: Text(
                'My Favorite',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600, color: cs.onSurface),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(AppSpacing.md.w),
                itemCount: _categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: AppSpacing.sm.h,
                  crossAxisSpacing: AppSpacing.sm.w,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final (category, data) = _categories[index];
                  return FavoriteCategoryCard(
                    data: data,
                    onTap: () => _onCategoryTap(context, category),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
