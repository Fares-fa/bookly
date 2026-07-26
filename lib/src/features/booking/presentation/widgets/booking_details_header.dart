import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/generated/l10n.dart';

/// Back button + centered title header for `BookingDetailsScreen`.
class BookingDetailsHeader extends StatelessWidget {
  const BookingDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.md.w, vertical: AppSpacing.sm.h),
      child: SizedBox(
        height: 40.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              S.of(context).bookingDetailsTitle,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: cs.onSurface),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  if (context.canPop()) context.pop();
                },
                child: Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(color: cs.primary, shape: BoxShape.circle),
                  child: const Icon(Icons.chevron_left, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
