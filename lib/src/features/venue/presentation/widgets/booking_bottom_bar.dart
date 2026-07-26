import 'package:bookly/src/imports/imports.dart';

/// Pinned bottom bar for the booking wizard: a 3-segment progress indicator,
/// the circular "Menu" shortcut and the step's primary CTA.
///
/// [stepIndex] is 0-based — segments `0..stepIndex` render filled. The CTA is
/// disabled (dimmed) while [enabled] is false.
class BookingBottomBar extends StatelessWidget {
  const BookingBottomBar({
    super.key,
    required this.stepIndex,
    required this.label,
    required this.onContinue,
    required this.menuRoute,
    this.menuIcon = Icons.room_service_outlined,
    this.totalSteps = 3,
    this.enabled = true,
  });

  final int stepIndex;
  final int totalSteps;
  final String label;
  final VoidCallback onContinue;
  final bool enabled;
  final String menuRoute;

  /// Cutlery for a restaurant, a cup for a cafe.
  final IconData menuIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: EdgeInsets.fromLTRB(
        AppSpacing.pagePadding,
        AppSpacing.ms,
        AppSpacing.pagePadding,
        AppSpacing.ms + MediaQuery.of(context).padding.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppSegmentedProgressBar(
            segmentCount: totalSteps,
            currentIndex: stepIndex,
            progress: 1,
            height: 5,
            gap: 8,
            trackColor: AppColors.divider,
            fillColor: AppColors.primary,
          ),
          SizedBox(height: AppSpacing.md),
          Row(
            children: [
              _MenuButton(icon: menuIcon, route: menuRoute),
              SizedBox(width: AppSpacing.md),
              Expanded(
                child: AppButton(
                  label: label,
                  isFullWidth: true,
                  customHeight: 60.h,
                  labelFontWeight: FontWeight.w600,
                  borderRadius: AppBorders.full,
                  onPressed: enabled ? onContinue : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({required this.icon, required this.route});

  final IconData icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        width: 60.w,
        height: 60.w,
        decoration: const BoxDecoration(
          color: AppColors.menuBg,
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primary, size: 22),
            SizedBox(height: 2.h),
            Text('Menu', style: AppTextStyle.primaryW500Size9),
          ],
        ),
      ),
    );
  }
}
