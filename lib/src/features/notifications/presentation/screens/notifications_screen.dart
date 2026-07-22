import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/notifications/presentation/widgets/notifications_header.dart';
import 'package:bookly/src/features/notifications/presentation/widgets/notification_tile.dart';
import 'package:bookly/src/features/notifications/presentation/widgets/empty_notifications.dart';

// TODO: Replace with real data from a notifications repository/provider once
// one exists.
const _placeholderNotifications = <String>[
  'Enjoy exclusive deals and save big today',
  'Enjoy exclusive deals and save big today',
  'Enjoy exclusive deals and save big today',
  'Enjoy exclusive deals and save big today',
];

/// Notifications list, with a "No Notifications" empty state when there
/// aren't any. Self-contained — the caller decides how/when to navigate here.
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            const NotificationsHeader(),
            Expanded(
              child: _placeholderNotifications.isEmpty
                  ? const EmptyNotifications()
                  : ListView.separated(
                      padding: EdgeInsets.all(AppSpacing.md.w),
                      itemCount: _placeholderNotifications.length,
                      separatorBuilder: (context, index) => SizedBox(height: AppSpacing.lg.h),
                      itemBuilder: (context, index) => NotificationTile(
                        message: _placeholderNotifications[index],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
