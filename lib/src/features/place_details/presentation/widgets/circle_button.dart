import 'package:bookly/src/imports/imports.dart';
import 'package:flutter/material.dart';
import 'package:bookly/src/theme/app_colors.dart';
import 'package:bookly/src/imports/packages_imports.dart';

class CircleButton extends StatelessWidget {
  final String name;
  final Color iconColor;
  final bool? isPng;
  final VoidCallback onTap;
  const CircleButton({
    super.key,
    this.isPng,
    required this.name,
    required this.onTap,
    this.iconColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        alignment: Alignment.center,
        // decoration: BoxDecoration(
        //   shape: BoxShape.circle,
        // ),
        child: isPng == true
            ? Image.asset(name)
            : VectorGraphic(
                loader: AssetBytesLoader(name),
              ),
      ),
    );
  }
}
