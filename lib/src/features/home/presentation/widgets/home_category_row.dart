import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/home/presentation/widgets/home_category_spec.dart';
import 'package:bookly/src/features/home/presentation/widgets/home_category_tile.dart';

/// Row of quick-access category shortcuts (Hotels / Cafe / Restaurant / More).
///
/// Only 4 fixed items, so a plain [Row] is used instead of a [ListView] —
/// no scrolling or lazy building needed for a handful of static tiles.
class HomeCategoryRow extends StatelessWidget {
  const HomeCategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding,),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final category in HomeCategorySpec.categories) ...[
            Expanded(flex: category.tinted ? 2 : 3, child: HomeCategoryTile(data: category)),
            if (category != HomeCategorySpec.categories.last) const SizedBox(width: 3),
          ],
        ],
      ),
    );
  }
}