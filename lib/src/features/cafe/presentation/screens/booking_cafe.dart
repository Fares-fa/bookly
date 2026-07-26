import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/features/home/presentation/widgets/home_search_bar.dart';
import 'package:bookly/src/features/venue/presentation/widgets/venue_widgets.dart';

/// Cafe listing screen: cover header, search, menu filters and the nearby /
/// top-rated / coming-soon sections.
class BookingCafe extends StatelessWidget {
  const BookingCafe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: VenueBookingHeader(
              title: S.of(context).cafeBookingHeaderTitle,
              imageAsset: AppAssets.cafeImage,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const HomeSearchBar(),
                VenueFilterRow(
                  filters: [
                    S.of(context).cafeFilterAll,
                    S.of(context).cafeFilterCoffee,
                    S.of(context).cafeFilterDessert,
                  ],
                ),
                NearbyPlacesSection(
                  onPlaceTap: (_) => context.push(AppRoutes.cafe),
                ),
                SizedBox(height: AppSpacing.md),
                TopRatedSection(
                  title: S.of(context).cafeTopRatedTitle,
                  onPlaceTap: (_) => context.push(AppRoutes.cafe),
                ),
                ComingSoonSection(title: S.of(context).cafeComingSoonTitle),
                SizedBox(height: AppSpacing.xl),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
