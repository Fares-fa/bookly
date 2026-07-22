import 'package:flutter/material.dart';
import 'package:bookly/src/imports/core_imports.dart';
import 'package:bookly/src/imports/packages_imports.dart';
import 'package:bookly/src/theme/app_text_style.dart';


/// Location line with a pin icon under the title.
class LocationRow extends StatelessWidget {
  const LocationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppAssets.location,
        ),
        const SizedBox(width: 6),
        Text('El ramel Station', style: AppTextStyle.grey400Size14),
      ],
    );
  }
}
