import 'package:bookly/src/features/hotels/presentation/widgets/counter_button.dart';
import 'package:bookly/src/imports/imports.dart';

class CounterField extends StatelessWidget {
  const CounterField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.minValue = 0,
    this.maxValue = 20,
    this.icon,
  });

  final Widget? icon;
  final String label;
  final int value;
  final int minValue;
  final int maxValue;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final tt = context.textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              spacing: 6,
              children: [
                if (icon != null) icon!,
                Text(
                  label,
                  style: tt.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
              ],
            ),
          ),
          CounterButton(
            icon: Icons.remove,
            onTap: value > minValue ? () => onChanged(value - 1) : null,
          ),
          SizedBox(
            width: 28,
            child: Text(
              '$value',
              textAlign: TextAlign.center,
              style: tt.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1A1A1A),
              ),
            ),
          ),
          CounterButton(
            icon: Icons.add,
            onTap: value < maxValue ? () => onChanged(value + 1) : null,
          ),
        ],
      ),
    );
  }
}
