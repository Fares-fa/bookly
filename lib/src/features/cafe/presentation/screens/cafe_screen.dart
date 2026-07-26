import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/cafe/domain/cafe_spec.dart';
import 'package:bookly/src/features/cafe/presentation/providers/cafe_ui_provider.dart';
import 'package:bookly/src/features/venue/presentation/widgets/venue_widgets.dart';

class CafeScreen extends StatelessWidget {
  const CafeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Fixed hero — stays pinned while the content below scrolls.
          VenueHeroSection(spec: cafeSpec, uiProvider: cafeUiProvider),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VenueTitleRow(name: cafeSpec.name, rating: cafeSpec.rating),
                  const SizedBox(height: 6),
                  VenueLocationRow(location: cafeSpec.location),
                  const SizedBox(height: 12),
                  VenueTabBar(
                    tabs: VenueTabContent.tabs,
                    uiProvider: cafeUiProvider,
                  ),
                  const Divider(
                      height: 1, thickness: 1, color: AppColors.divider),
                  const SizedBox(height: 12),
                  VenueTabContent(spec: cafeSpec, uiProvider: cafeUiProvider),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          const VenueBottomBar(
            menuRoute: AppRoutes.cafeMenu,
            bookRoute: AppRoutes.cafeBookTable,
            menuIcon: Icons.local_cafe_outlined,
          ),
        ],
      ),
    );
  }
}
