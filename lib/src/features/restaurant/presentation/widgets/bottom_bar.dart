import 'package:flutter/material.dart';

import 'package:bookly/src/theme/app_colors.dart';
import 'package:bookly/src/theme/app_text_style.dart';

/// Pinned bottom action bar: circular Menu button + "Book Table" CTA.
class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

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
        children: [
          // Menu button
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 66,
              height: 66,
              decoration: const BoxDecoration(
                color: AppColors.menuBg,
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.room_service_outlined,
                      color: AppColors.primary, size: 24),
                  const SizedBox(height: 2),
                  Text('Menu', style: AppTextStyle.primaryW500Size9),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Book Table CTA
          Expanded(
            child: SizedBox(
              height: 66,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(33),
                  ),
                ),
                child: Text('Book Table', style: AppTextStyle.whiteW500Size16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
