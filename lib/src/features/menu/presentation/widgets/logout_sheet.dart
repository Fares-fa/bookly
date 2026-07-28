import 'package:bookly/src/imports/imports.dart';
import 'package:bookly/src/features/auth/presentation/providers/session_provider.dart';

/// Shows the "Are you sure you want to log out?" confirmation bottom sheet
/// and, if confirmed, logs the session out. [SessionListenerWrapper] reacts
/// to the resulting session change and redirects to onboarding on its own.
Future<void> showLogoutSheet(BuildContext context, WidgetRef ref) {
  return context.showAppBottomSheet<void>(
    isScrollControlled: true,
    useRootNavigator: true,
    builder: (sheetContext) => _LogoutSheet(
      onConfirm: () => ref.read(sessionProvider.notifier).logout(),
    ),
  );
}

class _LogoutSheet extends StatelessWidget {
  const _LogoutSheet({required this.onConfirm});

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.xl,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 6.h,
            decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: BorderRadius.circular(20)),
          ),
          SizedBox(height: AppSpacing.xl),

          VectorGraphic(
            loader: const AssetBytesLoader(AppAssets.logout),
            width: 32,
            height: 32,
            colorFilter: ColorFilter.mode(cs.error, BlendMode.srcIn),
          ),
          SizedBox(height: AppSpacing.sm),
          Text(
            'Log out',
            style: tt.titleLarge?.copyWith(
                color: cs.error,
                fontWeight: FontWeight.w500,
                fontSize: 24
            ),
          ),
          SizedBox(height: AppSpacing.ml),
          Text(
            'Are you sure you want to log out?',
            textAlign: TextAlign.center,
            style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant, fontSize: 16),
          ),
          SizedBox(height: AppSpacing.xxl),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  color: Colors.white,
                  label: 'Cancel',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey
                  ),
                  isFullWidth: true,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              SizedBox(width: AppSpacing.ms),
              Expanded(
                child: AppButton(
                  label: 'Yes Log out',
                  labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                  variant: ButtonVariant.primary,
                  color: cs.error,
                  textColor: Colors.white,
                  borderRadius: AppBorders.full,
                  isFullWidth: true,
                  onPressed: () {
                    Navigator.of(context).pop();
                    onConfirm();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}