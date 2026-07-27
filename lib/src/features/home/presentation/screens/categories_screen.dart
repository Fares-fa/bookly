import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/home/presentation/widgets/home_category_spec.dart';
import 'package:bookly/src/features/home/presentation/widgets/category_grid_tile.dart';

/// Full category grid opened from the "More" tile in [HomeCategoryRow].
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BodyApp(
      txtCustomAppBar:S.of(context).homeCategoriesTitle,
      onPressedArrowBack: () => context.pop(),
      bodyOfContent: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding, vertical: AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: AppSpacing.lg),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: HomeCategorySpec.allCategories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: AppSpacing.sm,
                    crossAxisSpacing: AppSpacing.sm,
                    childAspectRatio: 0.82,
                  ),
                  itemBuilder: (context, index) =>
                      CategoryGridTile(data: HomeCategorySpec.allCategories[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}