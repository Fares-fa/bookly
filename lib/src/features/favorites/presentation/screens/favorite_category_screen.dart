import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/favorites/presentation/favorite_category.dart';
import 'package:bookly/src/features/favorites/presentation/widgets/hotel_card.dart';

// TODO: Replace with real data from a favorites repository/provider once one
// exists, keyed by category. Every image slot below points at the same
// placeholder asset until real photos/logos are available.
const placeholderHotels = <HotelCardData>[
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
      price: 'EGP 98,520',
      numberOfNights: 5),
  HotelCardData(
    price: 'EGP 98,520',
    numberOfNights: 5,
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

/// Favorites list for a single [FavoriteCategory] — its title reflects
/// whichever category the user picked on [MyFavoritesScreen]. Self-contained;
/// the caller decides how/when to navigate here.
class FavoriteCategoryScreen extends StatelessWidget {
  const FavoriteCategoryScreen({super.key, required this.category});

  final FavoriteCategory category;

  @override
  Widget build(BuildContext context) {
    return BodyApp(
      txtCustomAppBar:category.screenTitle(context),
      onPressedArrowBack: () => context.pop(),
      bodyOfContent: SafeArea(
        child: Column(
          children: [

            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(AppSpacing.md.w),
                itemCount: placeholderHotels.length,
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSpacing.md.h),
                itemBuilder: (context, index) => HotelCard(
                  data: placeholderHotels[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

