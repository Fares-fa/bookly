import 'package:bookly/src/imports/imports.dart';

/// A single tappable row inside a [MorePage] menu group: leading SVG icon,
/// label, and a trailing chevron. Icons render with their native SVG fill
/// unless [iconColor] is given (used to tint the logout row red).
class MoreMenuTile extends StatelessWidget {
  const MoreMenuTile({
    super.key,
    required this.icon,
    required this.label,
    this.iconColor,
    this.onTap,
  });

  final String icon;
  final String label;
  final Color? iconColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;
    final appColors = context.appColors;
    return InkWell(
      onTap: onTap,
      splashColor: Colors.white.withValues(alpha: 0.3),
      highlightColor: Colors.white.withValues(alpha: 0.15),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.ms,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 18,
              height: 18,
              child: VectorGraphic(
                loader: AssetBytesLoader(icon),
                colorFilter: iconColor != null
                    ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                    : null,
              ),
            ),
            SizedBox(width: AppSpacing.ms),
            Expanded(
              child: Text(
                label,
                style: tt.bodyLarge?.copyWith(
                  color: appColors.blackText,
                  fontWeight: FontWeight.w400,
                  fontSize: 14
                ),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: cs.onSurfaceVariant,
              size: 22.r,
            ),
          ],
        ),
      ),
    );
  }
}