import 'package:bookly/src/imports/imports.dart';

/// A label/value row used inside `PaymentSummary`.
class SummaryRow extends StatelessWidget {
  const SummaryRow({super.key, required this.label, required this.value, this.emphasize = false});

  final String label;
  final String value;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    final style = emphasize
        ? TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: cs.onSurface)
        : TextStyle(fontSize: 14.sp, color: cs.onSurfaceVariant);

    return Row(
      children: [
        Text(label, style: style),
        const Spacer(),
        Text(value, style: style),
      ],
    );
  }
}
