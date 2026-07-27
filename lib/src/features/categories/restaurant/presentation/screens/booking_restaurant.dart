import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/categories/venue/presentation/widgets/venue_widgets.dart';

import '../../../venue/presentation/widgets/search_bar.dart';

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
      body:
      Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              fit: BoxFit.cover,
              AppAssets.bookHotelBackground,
            ),
          ),
          CustomScrollView(
            slivers: [

              SliverToBoxAdapter(
                child: VenueBookingHeader(
                  title: S.of(context).restaurantBookingHeaderTitle,
                ),
              ),
              SliverToBoxAdapter(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F8FF),
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(28.r)),
                  ),
                  child: Column(
                    children: [
                      const SearchBarBooking(),
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
              ),
            ],
          ),
        ],
      )

    );
  }
}
