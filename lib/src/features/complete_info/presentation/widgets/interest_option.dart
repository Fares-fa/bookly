import 'package:bookly/src/imports/imports.dart';

class InterestOption extends StatelessWidget {
  const InterestOption({
    super.key,
    required this.label,
    required this.emoji,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String emoji;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;
    return InkWell(
      borderRadius: BorderRadius.circular(50.r),
      onTap: onTap,
      child: AnimatedContainer(
        duration: Durations.short1,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(
            color: selected ? cs.primary : cs.outlineVariant,
            width: selected ? 2 : 1,
          ),
          color: selected ? cs.primary.withValues(alpha: 0.08) : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 18)),
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
