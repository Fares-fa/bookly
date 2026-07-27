import 'package:bookly/src/imports/imports.dart';
import 'package:bookly/generated/l10n.dart';

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
            const VectorGraphic(loader: AssetBytesLoader(AppAssets.notificationIcon)),
            SizedBox(height: AppSpacing.lg.h),
            Text(
              S.of(context).notificationsEmptyTitle,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: cs.onSurface),
            ),
            SizedBox(height: AppSpacing.sm.h),
            Text(
              S.of(context).notificationsEmptyMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, color: cs.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
