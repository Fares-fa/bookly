import 'package:bookly/src/imports/imports.dart';
import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/features/auth/presentation/providers/session_provider.dart';

/// Shows the "Are you sure you want to log out?" confirmation bottom sheet
/// and, if confirmed, logs the session out. [SessionListenerWrapper] reacts
/// to the resulting session change and redirects to onboarding on its own.
Future<void> showLogoutSheet(BuildContext context, WidgetRef ref) {
  return context.showAppBottomSheet<void>(
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
          Text(
            S.of(context).moreLogout,
            style: tt.titleLarge?.copyWith(
              color: cs.primary,
              fontWeight: FontWeight.w400,
              fontSize: 18
            ),
          ),
          SizedBox(height: AppSpacing.xxl),
          Text(
            S.of(context).moreLogoutConfirmMessage,
            textAlign: TextAlign.center,
            style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant,fontSize: 16),
          ),
          SizedBox(height: AppSpacing.xxl),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  label: S.of(context).cancel,
                  labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),
                  variant: ButtonVariant.outline,
                  borderRadius: AppBorders.full,
                  borderColor: cs.primary,
                  isFullWidth: true,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              SizedBox(width: AppSpacing.ms),
              Expanded(
                child: AppButton(
                  label: S.of(context).moreLogoutConfirm,
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                  ),
                  variant: ButtonVariant.secondary,
                  color: AppColors.menuBg,
                  textColor: cs.error,
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