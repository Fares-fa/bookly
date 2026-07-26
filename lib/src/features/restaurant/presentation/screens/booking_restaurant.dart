import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/home/presentation/widgets/home_search_bar.dart';
import 'package:bookly/src/features/venue/presentation/widgets/venue_widgets.dart';

/// Restaurant listing screen: cover header, search, cuisine filters and the
/// nearby / top-rated / coming-soon sections.
class BookingRestaurant extends StatelessWidget {
  const BookingRestaurant({super.key});

  static const _filters = ['All', 'Burger', 'Pizaa'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: VenueBookingHeader(
              title: 'Booking Restaurant',
              imageAsset: AppAssets.rest,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const HomeSearchBar(),
                const VenueFilterRow(filters: _filters),
                NearbyPlacesSection(
                  onPlaceTap: (_) => context.push(AppRoutes.restaurant),
                ),
                SizedBox(height: AppSpacing.md),
                TopRatedSection(
                  title: 'Top Rated Places ⭐',
                  onPlaceTap: (_) => context.push(AppRoutes.restaurant),
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
