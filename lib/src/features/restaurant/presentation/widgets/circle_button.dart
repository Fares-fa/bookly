import 'package:flutter/material.dart';
import 'package:bookly/src/theme/app_colors.dart';
import 'package:bookly/src/imports/packages_imports.dart';

class CircleButton extends StatelessWidget {
  final String name;
  final Color iconColor;
  final VoidCallback onTap;
  const CircleButton({
    super.key,
    required this.name,
    required this.onTap,
    this.iconColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        name,
      ),
    );
  }
}
