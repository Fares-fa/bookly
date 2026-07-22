import 'package:bookly/src/imports/core_imports.dart';

/// "Facilities" tab: a grid-ish list of amenities with a "See More" action.
class FacilitiesSection extends StatelessWidget {
  const FacilitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Facilities', style: AppTextStyle.blackW500Size17),
        const SizedBox(height: 20),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _Facility(icon: Icons.local_parking, label: 'Parking')),
            Expanded(child: _Facility(icon: Icons.wifi, label: 'Fast Wifi')),
            Expanded(child: _Facility(icon: Icons.ac_unit, label: 'Air Con..')),
          ],
        ),
        const SizedBox(height: 20),
        const _Facility(icon: Icons.child_care, label: 'Kids Area'),
        const SizedBox(height: 14),
        GestureDetector(
          onTap: () {},
          child: Text(
            'See More',
            style:
                AppTextStyle.blackW400Size14.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}

class _Facility extends StatelessWidget {
  final IconData icon;
  final String label;
  const _Facility({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.black, size: 22),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.blackW400Size14,
          ),
        ),
      ],
    );
  }
}
