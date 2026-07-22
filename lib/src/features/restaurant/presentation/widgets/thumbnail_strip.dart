import 'package:flutter/material.dart';

import 'package:bookly/src/shared/app_assets.dart';
import 'package:bookly/src/theme/app_colors.dart';
import 'package:bookly/src/theme/app_text_style.dart';

/// White gallery strip of square thumbnails resting on the hero image.
/// The last thumbnail shows a "+N" overlay for the remaining photos.
class ThumbnailStrip extends StatelessWidget {
  const ThumbnailStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          _thumb(AppAssets.rest1),
          _thumb(AppAssets.rest2),
          _thumb(AppAssets.rest3),
          _thumb(AppAssets.rest1),
          _thumb(AppAssets.rest2, overlayText: '+150'),
        ],
      ),
    );
  }

  Widget _thumb(String asset, {String? overlayText}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(asset, fit: BoxFit.cover),
                if (overlayText != null)
                  Container(
                    color: AppColors.scrimStrong,
                    alignment: Alignment.center,
                    child: Text(
                      overlayText,
                      style: AppTextStyle.thumbnailOverlay,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
