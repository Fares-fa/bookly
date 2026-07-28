import 'package:bookly/src/imports/imports.dart';

/// A single tappable row inside a [MorePage] menu group: leading SVG icon,
/// label, and a trailing chevron — or a [Switch] when [showSwitch] is true.
/// Icons render with their native SVG fill unless [iconColor] is given
/// (used to tint the logout row red).
class MenuTile extends StatelessWidget {
  const MenuTile({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    this.showSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged,
  });

  final String icon;
  final String label;
  final VoidCallback? onTap;
  final bool showSwitch;
  final bool switchValue;
  final ValueChanged<bool>? onSwitchChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.white.withValues(alpha: 0.3),
      highlightColor: Colors.white.withValues(alpha: 0.15),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 18,
              height: 18,
              child: VectorGraphic(
                loader: AssetBytesLoader(icon),
                colorFilter:
                const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
            ),
            SizedBox(width: AppSpacing.ms),
            Expanded(
              child: Text(
                label,
                style: AppTextStyle.blackW400Size14,
              ),
            ),
            if (showSwitch)
              Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: switchValue,
                  onChanged: onSwitchChanged,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  trackOutlineColor:
                  const WidgetStatePropertyAll(Colors.transparent),
                  trackOutlineWidth: const WidgetStatePropertyAll(0),
                  thumbColor: const WidgetStatePropertyAll(Colors.white),
                  trackColor: WidgetStateProperty.resolveWith(
                        (states) => states.contains(WidgetState.selected)
                        ? Colors.green
                        : AppColors.grey.withValues(alpha: 0.4),
                  ),
                ),
              )
            else
              Icon(
                Icons.chevron_right_rounded,
                color: AppColors.grey,
                size: 22.r,
              ),
          ],
        ),
      ),
    );
  }
}