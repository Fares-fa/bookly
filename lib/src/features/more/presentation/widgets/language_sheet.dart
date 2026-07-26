import 'package:bookly/src/imports/imports.dart';
import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/features/more/presentation/providers/locale_provider.dart';

/// Shows the language picker bottom sheet: device default, English, Arabic.
/// Selecting one updates [localeProvider], which rebuilds the app under the
/// new locale immediately.
Future<void> showLanguageSheet(BuildContext context, WidgetRef ref) {
  return context.showAppBottomSheet<void>(
    useRootNavigator: true,
    builder: (sheetContext) => const _LanguageSheet(),
  );
}

class _LanguageSheet extends ConsumerWidget {
  const _LanguageSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;
    final current = ref.watch(localeProvider);

    void select(Locale? locale) {
      ref.read(localeProvider.notifier).setLocale(locale);
      Navigator.of(context).pop();
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.lg, AppSpacing.lg, AppSpacing.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).moreLanguageTitle,
            style: tt.titleLarge?.copyWith(
              color: cs.primary,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          SizedBox(height: AppSpacing.lg),
          _LanguageOption(
            label: S.of(context).moreUseDeviceLanguage,
            selected: current == null,
            onTap: () => select(null),
          ),
          const AppDivider(),
          _LanguageOption(
            label: 'English',
            selected: current?.languageCode == 'en',
            onTap: () => select(const Locale('en')),
          ),
          const AppDivider(),
          _LanguageOption(
            label: 'العربية',
            selected: current?.languageCode == 'ar',
            onTap: () => select(const Locale('ar')),
          ),
        ],
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  const _LanguageOption({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSpacing.ms),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
            Icon(
              selected ? Icons.check_circle : Icons.circle_outlined,
              color: selected ? cs.primary : cs.outlineVariant,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
