import 'package:bookly/src/imports/core_imports.dart';
import 'package:flutter/material.dart';

import 'package:bookly/src/theme/app_text_style.dart';

/// "About" heading, description paragraph and a "See more" action.
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About', style: AppTextStyle.blackW500Size17),
        const SizedBox(height: 14),
        Text(
          'Sky Roof is a rooftop restaurant offering panoramic sea views, '
          'making it a popular destination for romantic dinners, gatherings '
          'with friends, and special occasions. The restaurant combines a '
          'relaxed atmosphere with international and seafood dishes.',
          style: AppTextStyle.blackW400Size14,
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {},
          child: Text('See more', style: AppTextStyle.blackW400Size14.copyWith(color: AppColors.primary)),
        ),
      ],
    );
  }
}
