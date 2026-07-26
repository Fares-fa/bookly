import 'package:flutter/material.dart';

import 'package:bookly/src/theme/app_colors.dart';
import 'package:bookly/src/theme/app_text_style.dart';

/// Pinned bottom action bar: secondary slot (button or info) + primary CTA.
class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    this.secondaryIcon = Icons.room_service_outlined,
    this.secondaryLabel = 'Menu',
    this.onSecondaryTap,
    this.secondaryWidget,
    this.ctaIcon,
    this.ctaLabel = 'Book Table',
    this.onCtaTap,
  });

  final IconData secondaryIcon;
  final String secondaryLabel;
  final VoidCallback? onSecondaryTap;

  /// Overrides the default secondary circular button entirely, e.g. to show
  /// price/nights info instead of a tappable action.
  final Widget? secondaryWidget;

  /// Optional icon shown before [ctaLabel] on the primary CTA button.
  final IconData? ctaIcon;
  final String ctaLabel;
  final VoidCallback? onCtaTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.fromLTRB(
        20,
        16,
        20,
        16 + MediaQuery.of(context).padding.bottom,
      ),
      child: Row(
        spacing: 16,
        children: [
          Expanded(
            child: SizedBox(
              height: 66,
              child: ElevatedButton(
                onPressed: onCtaTap ?? () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(33),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (ctaIcon != null) ...[
                      Icon(ctaIcon, color: AppColors.white, size: 20),
                      const SizedBox(width: 8),
                    ],
                    Text(ctaLabel, style: AppTextStyle.whiteW500Size16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
