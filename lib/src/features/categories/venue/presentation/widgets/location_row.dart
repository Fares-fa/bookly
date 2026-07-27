import 'package:bookly/src/imports/imports.dart';

/// Location line with a pin icon under the title.
class VenueLocationRow extends StatelessWidget {
  const VenueLocationRow({super.key, required this.location});

  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppAssets.location),
        const SizedBox(width: 6),
        Text(location, style: AppTextStyle.grey400Size14),
      ],
    );
  }
}
