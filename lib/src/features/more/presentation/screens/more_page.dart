import 'package:bookly/src/imports/imports.dart';
import 'package:bookly/src/features/auth/presentation/providers/session_provider.dart';
import 'package:bookly/src/features/more/presentation/widgets/more_header.dart';
import 'package:bookly/src/features/more/presentation/widgets/more_menu_tile.dart';
import 'package:bookly/src/features/more/presentation/widgets/logout_sheet.dart';

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
                      label: 'Account',
                      onTap: () {},
                    ),
                    AppDivider(indent: AppSpacing.md, endIndent: AppSpacing.md),
                    MoreMenuTile(
                      icon: AppAssets.support,
                      label: 'Support',
                      onTap: () {},
                    ),
                    AppDivider(indent: AppSpacing.md, endIndent: AppSpacing.md),
                    MoreMenuTile(
                      icon: AppAssets.settings,
                      label: 'setting',
                      onTap: () {},
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
                      label: 'Promo Codes',
                      onTap: () {},
                    ),
                    AppDivider(indent: AppSpacing.md, endIndent: AppSpacing.md),
                    MoreMenuTile(
                      icon: AppAssets.invite,
                      label: 'Invite Friend',
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
                      'Log out',
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