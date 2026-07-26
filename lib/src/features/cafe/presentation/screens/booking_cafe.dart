import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/home/presentation/widgets/home_search_bar.dart';
import 'package:bookly/src/features/venue/presentation/widgets/venue_widgets.dart';

/// Cafe listing screen: cover header, search, menu filters and the nearby /
/// top-rated / coming-soon sections.
class BookingCafe extends StatelessWidget {
  const BookingCafe({super.key});

  static const _filters = ['All', 'Coffee', 'Dessert'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: VenueBookingHeader(
              title: 'Booking Cafe',
              imageAsset: AppAssets.cafeImage,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const HomeSearchBar(),
                const VenueFilterRow(filters: _filters),
                NearbyPlacesSection(
                  onPlaceTap: (_) => context.push(AppRoutes.cafe),
                ),
                SizedBox(height: AppSpacing.md),
                TopRatedSection(
                  title: 'Top Rated Places ⭐',
                  onPlaceTap: (_) => context.push(AppRoutes.cafe),
                ),
                const ComingSoonSection(title: 'Cooming Soon'),
                SizedBox(height: AppSpacing.xl),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
