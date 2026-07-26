import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/home/presentation/widgets/home_header.dart';
import 'package:bookly/src/features/home/presentation/widgets/ad_section.dart';
import 'package:bookly/src/features/home/presentation/widgets/home_search_bar.dart';
import 'package:bookly/src/features/home/presentation/widgets/home_category_row.dart';

/// Home tab body. All data-fetching lives in the section widgets
/// ([AdSection], [NearbyPlacesSection], [LiveScreeningsSection]), each
/// watching its own provider — this screen is just the scroll shell.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    return Scaffold(
      backgroundColor:appColors.primary,
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: HomeHeader()),
          SliverToBoxAdapter(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: appColors.backgroundColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
              ),
              child: Column(
                children: [
                  const HomeSearchBar(),
                  const HomeCategoryRow(),
                  const AdSection(),
                  const NearbyPlacesSection(),
                  const LiveScreeningsSection(),
                  SizedBox(height: AppSpacing.md),
                  const TopRatedSection(),
                  const ComingSoonSection(),
                  SizedBox(height: AppSpacing.xl),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}