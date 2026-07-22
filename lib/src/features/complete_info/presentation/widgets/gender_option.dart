import 'package:bookly/src/imports/imports.dart';

class GenderOption extends StatelessWidget {
  const GenderOption({
    super.key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onTap,
      child: AnimatedContainer(
        height: 50,
        duration: Durations.short1,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: selected ? cs.primary : cs.outlineVariant,
            width: selected ? 2 : 1,
          ),
          color: selected ? cs.primary.withValues(alpha: 0.08) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4,
          children: [
            Icon(icon, color: selected ? cs.primary : cs.onSurfaceVariant),
            Text(label,
                style: tt.bodyMedium?.copyWith(
                    color: selected ? cs.primary : cs.onSurfaceVariant,
                    fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
