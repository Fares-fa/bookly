import 'package:flutter/material.dart';

import 'package:bookly/src/theme/app_colors.dart';
import 'package:bookly/src/theme/app_text_style.dart';

/// Price-per-person pill shown centered over the hero image.
class PricePill extends StatelessWidget {
  const PricePill({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.scrim,
        borderRadius: BorderRadius.circular(24),
      ),
      child: RichText(
        text: TextSpan(
          children:  [
            TextSpan(
              text: 'Price : 275EGP',
              style: AppTextStyle.whiteW500Size14,
            ),
            TextSpan(
              text: '/Person',
              style: AppTextStyle.greyW500Size12,

            ),
          ],
        ),
      ),
    );
  }
}
