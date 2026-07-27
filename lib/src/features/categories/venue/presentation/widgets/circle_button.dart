import 'package:bookly/src/imports/imports.dart';

/// Tappable SVG icon button used by the venue hero controls.
class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.name,
    required this.onTap,
    this.iconColor = AppColors.white,
  });

  final String name;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(name),
    );
  }
}

/// [CircleButton] for assets that ship as PNG rather than SVG.
class CircleButtonPng extends StatelessWidget {
  const CircleButtonPng({
    super.key,
    required this.name,
    required this.onTap,
    this.iconColor = AppColors.white,
  });

  final String name;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(name),
    );
  }
}
