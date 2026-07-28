import 'package:bookly/src/features/menu/presentation/widgets/balance_more_widget.dart';
import 'package:bookly/src/imports/imports.dart';
import 'package:bookly/src/features/auth/presentation/providers/session_provider.dart';

import '../widgets/menu_header.dart';
import '../widgets/menu_title.dart';

class Menu extends ConsumerStatefulWidget {
  const Menu({super.key});

  @override
  ConsumerState<Menu> createState() => _MenuState();
}

class _MenuState extends ConsumerState<Menu> {
  bool _biometricEnabled = false;

  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: AppSpacing.md),
              const BalanceMoreWidget(),
              SizedBox(height: AppSpacing.md),

              AppCard(
                showShadow: false,
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    MenuTile(
                      icon: AppAssets.settings,
                      label: 'Settings',
                      onTap: () {},
                    ),
                    AppDivider(
                        indent: AppSpacing.md,
                        endIndent: AppSpacing.md,
                        color: AppColors.dividerMenu),
                    MenuTile(
                      icon: AppAssets.payment,
                      label: 'Payment Method',
                      onTap: () {},
                    ),
                    AppDivider(
                        indent: AppSpacing.md,
                        endIndent: AppSpacing.md,
                        color: AppColors.dividerMenu),
                    MenuTile(
                      icon: AppAssets.language,
                      label: 'Language',
                      onTap: () {},
                    ),
                    AppDivider(
                        indent: AppSpacing.md,
                        endIndent: AppSpacing.md,
                        color: AppColors.dividerMenu),
                    MenuTile(
                      icon: AppAssets.fingerprint,
                      label: 'Enable Face ID /Fingerprint',
                      showSwitch: true,
                      switchValue: _biometricEnabled,
                      onTap: () => setState(
                              () => _biometricEnabled = !_biometricEnabled),
                      onSwitchChanged: (value) =>
                          setState(() => _biometricEnabled = value),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.ml),
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
                    AppDivider(
                        indent: AppSpacing.md,
                        endIndent: AppSpacing.md,
                        color: AppColors.dividerMenu),
                    MenuTile(
                      icon: AppAssets.support,
                      label: 'Support',
                      onTap: () {},
                    ),
                    AppDivider(
                        indent: AppSpacing.md,
                        endIndent: AppSpacing.md,
                        color: AppColors.dividerMenu),
                    MenuTile(
                      icon: AppAssets.invite,
                      label: 'Invite Friend',
                      onTap: () {},
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