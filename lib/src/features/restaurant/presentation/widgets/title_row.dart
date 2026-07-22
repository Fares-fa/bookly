import 'package:flutter/material.dart';

import 'package:bookly/src/theme/app_colors.dart';
import 'package:bookly/src/theme/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Restaurant name with a primary-colored rating badge on the right.
class TitleRow extends StatelessWidget {
  const TitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            'Sky Roof Restaurant',
            style: AppTextStyle.blackW500Size18,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(topRight: Radius.circular(18.r),bottomLeft:Radius.circular(18.r) ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star, color: AppColors.star, size: 18),
               SizedBox(width: 8.w),
              Text('9.5', style: AppTextStyle.whiteW500Size14),
            ],
          ),
        ),
      ],
    );
  }
}
