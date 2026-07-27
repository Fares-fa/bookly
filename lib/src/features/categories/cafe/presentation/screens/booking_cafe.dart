import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/features/categories/venue/presentation/widgets/venue_widgets.dart';

import '../../../venue/presentation/widgets/search_bar.dart';

/// Cafe listing screen: cover header, search, menu filters and the nearby /
/// top-rated / coming-soon sections.
class BookingCafe extends StatelessWidget {
  const BookingCafe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Image.asset(
            fit: BoxFit.fill,
            AppAssets.bookHotelBackground,
          ),
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: VenueBookingHeader(
                  title: S.of(context).cafeBookingHeaderTitle,
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
              ),
            ],
          ),        ],
      )


    );
  }
}
