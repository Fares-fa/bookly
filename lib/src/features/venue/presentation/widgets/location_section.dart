import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/imports/imports.dart';

/// "Location" tab: a map preview with a "See Location on map" action.
class VenueLocationSection extends StatelessWidget {
  const VenueLocationSection({super.key, required this.distance});

  /// Distance from the user, e.g. `0.5 KM`.
  final String distance;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).venueLocationTitle, style: AppTextStyle.blackW500Size17),
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
                      S.of(context).venueSeeLocationOnMapButton,
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
                SvgPicture.asset(AppAssets.location),
                Text(S.of(context).venueFromYourLocationLabel,
                    style: AppTextStyle.grey400Size14),
              ],
            ),
            Text(distance, style: AppTextStyle.grey400Size14),
          ],
        ),
      ],
    );
  }
}
