import 'package:bookly/src/imports/imports.dart';

/// A single tappable row inside a [MorePage] menu group: leading icon,
/// label, optional trailing value, and a trailing chevron. Icons render with
/// their native SVG fill unless [iconColor] is given (used to tint the
/// logout row red). Pass [materialIcon] instead of [icon] when there's no
/// SVG asset for it.
class MoreMenuTile extends StatelessWidget {
  const MoreMenuTile({
    super.key,
    this.icon,
    this.materialIcon,
    required this.label,
    this.trailingLabel,
    this.iconColor,
    this.onTap,
  }) : assert(icon != null || materialIcon != null, 'Provide icon or materialIcon');

  final String? icon;
  final IconData? materialIcon;
  final String label;
  final String? trailingLabel;
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
              child: materialIcon != null
                  ? Icon(materialIcon, size: 18, color: iconColor ?? appColors.blackText)
                  : VectorGraphic(
                      loader: AssetBytesLoader(icon!),
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
            if (trailingLabel != null) ...[
              Text(
                trailingLabel!,
                style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
              ),
              SizedBox(width: AppSpacing.xs),
            ],
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