import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/home/presentation/widgets/home_category_spec.dart';
import 'package:bookly/src/features/home/presentation/widgets/category_grid_tile.dart';

/// Full category grid opened from the "More" tile in [HomeCategoryRow].
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = context.theme.textTheme;

    return Scaffold(
      backgroundColor: const Color(0xFFEDF3FE),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding, vertical: AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 40,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => context.pop(),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(color: Color(0xFF0042D3), shape: BoxShape.circle),
                          child: const Icon(Icons.chevron_left_rounded, color: Colors.white),
                        ),
                      ),
                    ),
                    Text(
                      'Categories',
                      style: tt.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
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