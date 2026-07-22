import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/home/presentation/widgets/home_category_spec.dart';

/// A single tile in the [CategoriesScreen] grid: label, SVG illustration,
/// and — for categories that aren't live yet — a "Soon" ribbon overlay.
class CategoryGridTile extends StatelessWidget {
  const CategoryGridTile({super.key, required this.data});

  final HomeCategoryData data;

  @override
  Widget build(BuildContext context) {
    final tt = context.theme.textTheme;
    final cs = context.theme.colorScheme;

    void handleTap() {
      if (data.comingSoon) return;
      if (data.route != null) {
        context.go(data.route!);
      } else {
        context.showSnackBar('${data.label} coming soon');
      }
    }

    return GestureDetector(
      onTap: handleTap,
      behavior: HitTestBehavior.opaque,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: AppSpacing.ms),
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  data.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: tt.bodyMedium?.copyWith(color: cs.onSurface, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: AppSpacing.sm),
                Image.asset(data.icon, width: 44, height: 44),
                if (data.comingSoon) SizedBox(height: AppSpacing.lg),
              ],
            ),
          ),
          if (data.comingSoon)
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding,),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: AppSpacing.xs),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xFFF57C1F), Color(0xFF0042D3)]),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Text(
                  'Soon',
                  textAlign: TextAlign.center,
                  style: tt.bodySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
        ],
      ),
    );
  }
}