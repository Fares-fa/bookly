import 'package:bookly/src/imports/imports.dart';

/// "No Notifications" empty state for [NotificationsScreen].
class EmptyNotifications extends StatelessWidget {
  const EmptyNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.xl.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppAssets.notificationIcon),
            SizedBox(height: AppSpacing.lg.h),
            Text(
              'No Notifications',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: cs.onSurface),
            ),
            SizedBox(height: AppSpacing.sm.h),
            Text(
              "We'll let you know when there will be something to update you.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, color: cs.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
