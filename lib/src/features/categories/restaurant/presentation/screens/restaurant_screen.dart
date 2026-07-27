import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/categories/venue/presentation/widgets/venue_widgets.dart';

import '../../domain/restaurant_spec.dart';
import '../providers/restaurant_ui_provider.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Fixed hero — stays pinned while the content below scrolls.
          VenueHeroSection(
            spec: restaurantSpec,
            uiProvider: restaurantUiProvider,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VenueTitleRow(
                    name: restaurantSpec.name,
                    rating: restaurantSpec.rating,
                  ),
                  const SizedBox(height: 6),
                  VenueLocationRow(location: restaurantSpec.location),
                  const SizedBox(height: 12),
                  VenueTabBar(
                    tabs: VenueTabContent.tabs,
                    uiProvider: restaurantUiProvider,
                  ),
                  const Divider(
                      height: 1, thickness: 1, color: AppColors.divider),
                  const SizedBox(height: 12),
                  VenueTabContent(
                    spec: restaurantSpec,
                    uiProvider: restaurantUiProvider,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          const VenueBottomBar(
            menuRoute: AppRoutes.restaurantMenu,
            bookRoute: AppRoutes.bookTable,
          ),
        ],
      ),
    );
  }
}
