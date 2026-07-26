import '../../imports/imports.dart';

class _NavItemData {
  const _NavItemData({required this.icon, required this.label});

  final String icon;
  final String label;
}

const List<_NavItemData> _navItems = [
  _NavItemData(icon: AppAssets.home, label: 'Home'),
  _NavItemData(icon: AppAssets.booking, label: 'My Booking'),
  _NavItemData(icon: AppAssets.favorite, label: 'Favorite'),
  _NavItemData(icon: AppAssets.moreNav, label: 'More'),
];

const Color _activeColor = Color(0xFF0042D3);
const Color _inactiveColor = Color(0xFF9CA3AF);

/// Bottom navigation bar for the app's tab shell (see `AppShell`).
///
/// A bespoke bar (rather than Material 3's [NavigationBar]) so it can match
/// the exact design: SVG icons tinted by selection state, and a thin
/// indicator bar above the active tab.
class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 16, offset: const Offset(0, -4)),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64.h,
          child: Column(
            children: [
              // Mirrors the icon Row's Expanded partition below, rather than
              // positioning via fractional Alignment math, so the bar can't
              // drift out of sync with a tab's actual column width.
              Row(
                children: [
                  for (var i = 0; i < _navItems.length; i++)
                    Expanded(
                      child: Center(
                        child: AnimatedContainer(
                          duration: AppDurations.fast,
                          curve: AppCurves.standard,
                          width: i == currentIndex ? 32.w : 0,
                          height: 3.h,
                          decoration: BoxDecoration(color: _activeColor, borderRadius: BorderRadius.circular(2)),
                        ),
                      ),
                    ),
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    for (var i = 0; i < _navItems.length; i++)
                      Expanded(
                        child: _NavItem(
                          data: _navItems[i],
                          isSelected: i == currentIndex,
                          onTap: () => onTap(i),
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

class _NavItem extends StatelessWidget {
  const _NavItem({required this.data, required this.isSelected, required this.onTap});

  final _NavItemData data;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? _activeColor : _inactiveColor;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VectorGraphic(
            loader: AssetBytesLoader(data.icon),
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
          SizedBox(height: AppSpacing.xxs),
          Text(
            data.label,
            style: TextStyle(color: color, fontSize: 11.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}