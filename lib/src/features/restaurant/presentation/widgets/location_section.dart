import 'package:bookly/src/imports/core_imports.dart';

import '../../../../imports/imports.dart';

/// "Location" tab: a map preview with a "See Location on map" action.
class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Location', style: AppTextStyle.blackW500Size17),
        const SizedBox(height: 14),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Image.asset(
                AppAssets.map,
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned.fill(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'See Location on map',
                      style: AppTextStyle.whiteW400Size14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 6,
              children: [
                SvgPicture.asset(
                  AppAssets.location,
                ),
                Text('From Your location', style: AppTextStyle.grey400Size14),
              ],
            ),
            Text('0.5 KM', style: AppTextStyle.grey400Size14),

          ],
        ),

      ],
    );
  }
}
