import 'package:bookly/src/imports/imports.dart';

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
        child: isPng ?? false
            ? Image.asset(name)
            : VectorGraphic(
                loader: AssetBytesLoader(name),
              ),
      ),
    );
  }
}
