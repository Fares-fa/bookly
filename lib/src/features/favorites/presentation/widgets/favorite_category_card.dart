import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/favorites/presentation/widgets/favorite_category_card_data.dart';

export 'package:bookly/src/features/favorites/presentation/widgets/favorite_category_card_data.dart';

/// A favorites category tile: a 2x2 photo preview grid, a title, and a count
/// label — e.g. "Hotels" / "12 Hotels".
///
/// Usage:
/// ```dart
/// FavoriteCategoryCard(
///   data: category,
///   onTap: () => context.push(AppRoutes.favoriteCategory, extra: FavoriteCategory.hotels),
/// )
/// ```
class FavoriteCategoryCard extends StatelessWidget {
  const FavoriteCategoryCard({super.key, required this.data, this.onTap});

  final FavoriteCategoryCardData data;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    return AppCard(
      onTap: onTap,
      showShadow: true,
      padding: EdgeInsets.all(AppSpacing.xs.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 110.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 4,
                        child: CommonImage(
                          imageUrl: data.images[0],
                          fit: BoxFit.cover,
                          borderRadius: AppBorders.sm,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        flex: 2,
                        child: CommonImage(
                          imageUrl: data.images[1],
                          fit: BoxFit.cover,
                          borderRadius: AppBorders.sm,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4.h),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 2,
                        child: CommonImage(
                          imageUrl: data.images[2],
                          fit: BoxFit.cover,
                          borderRadius: AppBorders.sm,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        flex: 3,
                        child: CommonImage(
                          imageUrl: data.images[3],
                          fit: BoxFit.cover,
                          borderRadius: AppBorders.sm,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSpacing.sm.h),
          Text(
            data.title,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: cs.onSurface),
          ),
          SizedBox(height: 2.h),
          Text(
            data.countLabel,
            style: TextStyle(fontSize: 13.sp, color: cs.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
