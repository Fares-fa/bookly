import 'package:bookly/src/imports/imports.dart';

/// The "9.5 Excellent"-style pill badge shown inside a [HotelCard].
class HotelScoreBadge extends StatelessWidget {
  const HotelScoreBadge({super.key, required this.score, required this.label});

  final double score;
  final String label;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: cs.primaryContainer,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(14.r), topRight: Radius.circular(18.r)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star_rounded, size: 14.sp, color: Colors.amber),
          SizedBox(width: 6.w),
          Text(
            score.toStringAsFixed(1),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: cs.onPrimaryContainer,
              fontSize: 13.sp,
            ),
          ),
          SizedBox(width: 6.w),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: cs.onPrimaryContainer,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }
}
