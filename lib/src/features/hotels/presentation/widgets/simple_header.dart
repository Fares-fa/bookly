import 'package:bookly/src/imports/imports.dart';

class SimpleHeader extends StatelessWidget {
  const SimpleHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md.w, vertical: AppSpacing.sm.h),
      child: SizedBox(
        height: 50.w,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Row(spacing: 12, children: [
              GestureDetector(
                onTap: () {
                  if (context.canPop()) context.pop();
                },
                child: Container(
                  width: 32.w,
                  height: 32.w,
                  decoration:
                      BoxDecoration(color: cs.primary, shape: BoxShape.circle),
                  child: const Icon(Icons.chevron_left, color: Colors.white),
                ),
              ),
              Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: cs.onSurface),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "date",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: cs.onSurface),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
