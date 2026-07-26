import 'package:bookly/src/imports/imports.dart';
import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/features/auth/presentation/providers/session_provider.dart';
import 'package:bookly/src/features/more/presentation/widgets/more_header.dart';
import 'package:bookly/src/features/more/presentation/widgets/more_menu_tile.dart';
import 'package:bookly/src/features/more/presentation/widgets/logout_sheet.dart';
import 'package:bookly/src/features/more/presentation/widgets/language_sheet.dart';
import 'package:bookly/src/features/more/presentation/providers/locale_provider.dart';

/// Settings/account hub tab: identity header, account/support/settings menu,
/// promo/invite shortcuts, and logout — all data-fetching is left to
/// [sessionProvider], this screen is just the layout shell.
class MorePage extends ConsumerWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = context.theme.colorScheme;
    final user = ref.watch(sessionProvider).user;
    final appColors = context.appColors;
    final currentLocale = ref.watch(localeProvider);
    final languageLabel = switch (currentLocale?.languageCode) {
      'en' => 'English',
      'ar' => 'العربية',
      _ => S.of(context).moreUseDeviceLanguage,
    };
    return Scaffold(
      backgroundColor: appColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.pagePadding,
            vertical: AppSpacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MoreHeader(user: user),
              SizedBox(height: AppSpacing.xl),
              AppCard(
                showShadow: false,
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    MoreMenuTile(
                      icon: AppAssets.account,
                      label: S.of(context).moreAccount,
                      onTap: () {},
                    ),
                    AppDivider(indent: AppSpacing.md, endIndent: AppSpacing.md),
                    MoreMenuTile(
                      icon: AppAssets.support,
                      label: S.of(context).moreSupport,
                      onTap: () {},
                    ),
                    AppDivider(indent: AppSpacing.md, endIndent: AppSpacing.md),
                    MoreMenuTile(
                      icon: AppAssets.settings,
                      label: S.of(context).moreSettings,
                      onTap: () {},
                    ),
                    AppDivider(indent: AppSpacing.md, endIndent: AppSpacing.md),
                    MoreMenuTile(
                      materialIcon: Icons.language,
                      label: S.of(context).moreLanguageTitle,
                      trailingLabel: languageLabel,
                      onTap: () => showLanguageSheet(context, ref),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.sm),
              AppCard(
                showShadow: false,
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    MoreMenuTile(
                      icon: AppAssets.promo,
                      label: S.of(context).morePromoCodes,
                      onTap: () {},
                    ),
                    AppDivider(indent: AppSpacing.md, endIndent: AppSpacing.md),
                    MoreMenuTile(
                      icon: AppAssets.invite,
                      label: S.of(context).moreInviteFriend,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.xl),
              InkWell(
                onTap: () => showLogoutSheet(context, ref),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    VectorGraphic(
                      loader: const AssetBytesLoader(AppAssets.logout),
                      width: 18,
                      height: 18,
                      colorFilter: ColorFilter.mode(cs.error, BlendMode.srcIn),
                    ),
                    SizedBox(width: AppSpacing.sm),
                    Text(
                      S.of(context).moreLogout,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: cs.error,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}