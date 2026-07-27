import 'package:bookly/src/imports/imports.dart';
import 'package:bookly/src/features/auth/presentation/providers/session_provider.dart';


import '../widgets/logout_sheet.dart';
import '../widgets/menu_header.dart';
import '../widgets/menu_title.dart';


class Menu extends ConsumerWidget {
  const Menu({super.key});

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
              MenuHeader(user: user),
              SizedBox(height: AppSpacing.xl),
              AppCard(
                showShadow: false,
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    MenuTile(
                      icon: AppAssets.account,
                      label: 'Account',
                      onTap: () {},
                    ),
                    AppDivider(indent: AppSpacing.md, endIndent: AppSpacing.md,color:AppColors.dividerMenu),
                    MenuTile(
                      icon: AppAssets.support,
                      label: 'Support',
                      onTap: () {},
                    ),
                    AppDivider(indent: AppSpacing.md, endIndent: AppSpacing.md,color:AppColors.dividerMenu),
                    MenuTile(
                      icon: AppAssets.settings,
                      label: 'Settings',
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
                    MenuTile(
                      icon: AppAssets.promo,
                      label: 'Promo Codes',
                      onTap: () {},
                    ),
                    AppDivider(indent: AppSpacing.md, endIndent: AppSpacing.md,color:AppColors.dividerMenu),
                    MenuTile(
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