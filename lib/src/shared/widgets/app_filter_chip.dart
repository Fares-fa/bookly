import '../../imports/imports.dart';

/// A small pill control, e.g. an "All" filter next to a section title.
class AppFilterChip extends StatelessWidget {
  const AppFilterChip({super.key, required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xxs),
        decoration: BoxDecoration(
          color: cs.primary.withValues(alpha: 0.2),
          borderRadius: AppBorders.full,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const VectorGraphic(
              loader: AssetBytesLoader(AppAssets.filter),
              width: 15,
              height: 15,
            ),

            SizedBox(width: 4.w),
            Text(
              label,
              style: TextStyle(fontSize: 13.sp, color: cs.primary, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}