import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/home/presentation/widgets/home_search_bar.dart';
import 'package:bookly/src/features/venue/presentation/widgets/venue_widgets.dart';

/// Restaurant listing screen: cover header, search, cuisine filters and the
/// nearby / top-rated / coming-soon sections.
class BookingRestaurant extends StatelessWidget {
  const BookingRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    final filters = [
      S.of(context).restaurantFilterAll,
      S.of(context).restaurantFilterBurger,
      S.of(context).restaurantFilterPizza,
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: VenueBookingHeader(
              title: S.of(context).restaurantBookingHeaderTitle,
              imageAsset: AppAssets.rest,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const HomeSearchBar(),
                VenueFilterRow(filters: filters),
                NearbyPlacesSection(
                  onPlaceTap: (_) => context.push(AppRoutes.restaurant),
                ),
                SizedBox(height: AppSpacing.md),
                TopRatedSection(
                  title: S.of(context).restaurantTopRatedTitle,
                  onPlaceTap: (_) => context.push(AppRoutes.restaurant),
                ),
                ComingSoonSection(title: S.of(context).restaurantComingSoonTitle),
                SizedBox(height: AppSpacing.xl),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
