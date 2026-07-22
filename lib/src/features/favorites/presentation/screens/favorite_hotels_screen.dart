import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/favorites/presentation/widgets/hotel_card.dart';

// TODO: Replace with real data from a favorites repository/provider once one
// exists. Every image slot below points at the same placeholder asset until
// real hotel photos/logos are available.
const _placeholderHotels = <HotelCardData>[
  HotelCardData(
    logoAsset: AppAssets.favouritesHotel,
    name: 'Mövenpick resort',
    starRating: 5,
    mainImage: AppAssets.favouritesHotel,
    secondaryImage: AppAssets.favouritesHotel,
    overlayImage: AppAssets.favouritesHotel,
    morePhotosCount: 150,
    score: 9.5,
    scoreLabel: 'Excellent',
    reviewCount: 20548,
    location: 'Namaa Bay',
    features: ['All Inclusive', 'Free Cancelation'],
  ),
  HotelCardData(
    logoAsset: AppAssets.favouritesHotel,
    name: 'Mövenpick resort',
    starRating: 5,
    mainImage: AppAssets.favouritesHotel,
    secondaryImage: AppAssets.favouritesHotel,
    overlayImage: AppAssets.favouritesHotel,
    morePhotosCount: 150,
    score: 9.5,
    scoreLabel: 'Excellent',
    reviewCount: 20548,
    location: 'Namaa Bay',
    features: ['All Inclusive', 'Free Cancelation'],
  ),
];

/// Favorite hotels list. Self-contained — the caller decides how/when to
/// navigate here (no route is registered by this file).
class FavoriteHotelsScreen extends StatelessWidget {
  const FavoriteHotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            const _Header(),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(AppSpacing.md.w),
                itemCount: _placeholderHotels.length,
                separatorBuilder: (context, index) => SizedBox(height: AppSpacing.md.h),
                itemBuilder: (context, index) => HotelCard(
                  data: _placeholderHotels[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.md.w, vertical: AppSpacing.sm.h),
      child: SizedBox(
        height: 40.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              'Favorite Hotels',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: cs.onSurface),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  if (context.canPop()) context.pop();
                },
                child: Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(color: cs.primary, shape: BoxShape.circle),
                  child: const Icon(Icons.chevron_left, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
