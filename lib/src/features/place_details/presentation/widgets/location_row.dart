import 'package:bookly/src/imports/core_imports.dart';
import 'package:bookly/src/imports/packages_imports.dart';

/// Location line with a pin icon under the title.
class LocationRow extends StatelessWidget {
  const LocationRow({super.key, required this.location});

  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const VectorGraphic(loader: AssetBytesLoader(AppAssets.location)),
        const SizedBox(width: 6),
        Text(location, style: AppTextStyle.grey400Size14),
      ],
    );
  }
}
