import 'package:bookly/src/imports/imports.dart';

/// A labeled date/time column used inside `HotelStayCard`
/// (e.g. "Check In" / "16 Feb 2026" / "From 02:00 PM").
class StayColumn extends StatelessWidget {
  const StayColumn({
    super.key,
    required this.label,
    required this.primary,
    this.secondary,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String label;
  final String primary;
  final String? secondary;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(label, style: TextStyle(fontSize: 12.sp, color: cs.onSurfaceVariant)),
        SizedBox(height: 2.h),
        Text(primary, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: cs.onSurface)),
        if (secondary != null) ...[
          SizedBox(height: 2.h),
          Text(secondary!, style: TextStyle(fontSize: 11.sp, color: cs.onSurfaceVariant)),
        ],
      ],
    );
  }
}
