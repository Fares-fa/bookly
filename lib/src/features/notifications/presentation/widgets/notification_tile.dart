import 'package:bookly/src/imports/imports.dart';

/// A single notification row: bell icon + message.
class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(AppAssets.notificationIcon, width: 18.w),
        SizedBox(width: AppSpacing.sm.w),
        Expanded(
          child: Text(
            message,
            style: TextStyle(fontSize: 13.sp, color: cs.onSurface, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
