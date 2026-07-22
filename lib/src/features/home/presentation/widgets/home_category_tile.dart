import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/home/presentation/widgets/home_category_spec.dart';

class HomeCategoryTile extends StatelessWidget {
  const HomeCategoryTile({super.key, required this.data});

  final HomeCategoryData data;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;

    void handleTap() {
      if (data.route != null) {
        context.push(data.route!);
      } else {
        context.showSnackBar('${data.label} coming soon');
      }
    }

    return GestureDetector(
      onTap: handleTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.ms),
        decoration: BoxDecoration(
          color:  Colors.white,
          borderRadius: AppBorders.card,
          boxShadow: AppShadows.subtle,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: data.tinted?[
            Image.asset(
              data.icon,
              width: data.tinted ? 22 : 40,
              height: 40,
            ),
            SizedBox(height: AppSpacing.xs),
            Text(
              data.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: tt.bodySmall?.copyWith(
                color: data.tinted ? cs.primary : cs.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),


          ]: [
            Text(
              data.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: tt.bodySmall?.copyWith(
                color: data.tinted ? cs.primary : cs.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: AppSpacing.xs),
            Image.asset(
              data.icon,
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}