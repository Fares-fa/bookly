import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/venue/domain/venue_spec.dart';

/// "Facilities" tab: the first three amenities on one row, the rest stacked
/// underneath, then a "See More" action.
class VenueFacilitiesSection extends StatelessWidget {
  const VenueFacilitiesSection({super.key, required this.facilities});

  final List<VenueFacility> facilities;

  @override
  Widget build(BuildContext context) {
    final firstRow = facilities.take(3).toList();
    final rest = facilities.skip(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).venueFacilitiesTitle, style: AppTextStyle.blackW500Size17),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final facility in firstRow)
              Expanded(child: _Facility(facility: facility)),
          ],
        ),
        for (final facility in rest) ...[
          const SizedBox(height: 20),
          _Facility(facility: facility),
        ],
        const SizedBox(height: 14),
        GestureDetector(
          onTap: () {},
          child: Text(
            S.of(context).venueFacilitiesSeeMore,
            style:
                AppTextStyle.blackW400Size14.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}

class _Facility extends StatelessWidget {
  const _Facility({required this.facility});

  final VenueFacility facility;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(facility.icon, color: AppColors.black, size: 22),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            facility.label,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.blackW400Size14,
          ),
        ),
      ],
    );
  }
}
