import 'package:bookly/src/imports/imports.dart';

/// Price-per-person pill shown centered over the hero image.
class PricePill extends StatelessWidget {
  const PricePill({super.key, required this.price});

  /// Formatted amount, e.g. `275EGP`.
  final String price;

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
          children: [
            TextSpan(
              text: 'Price : $price',
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
