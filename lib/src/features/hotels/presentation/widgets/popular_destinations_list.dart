import 'package:bookly/src/features/hotels/presentation/widgets/destination.dart';
import 'package:bookly/src/features/hotels/presentation/widgets/destination_list_tile.dart';
import 'package:bookly/src/imports/imports.dart';

class PopularDestinationsList extends StatelessWidget {
  const PopularDestinationsList({super.key});

  static const _destinations = [
    Destination(city: 'Cairo', numberOfHotels: '1,050'),
    Destination(city: 'Mansoura', numberOfHotels: '500'),
    Destination(city: 'Sharm', numberOfHotels: '200'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular Destinations',
          style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(height: AppSpacing.sm.h),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _destinations.length,
          separatorBuilder: (_, __) => SizedBox(height: AppSpacing.sm.h),
          itemBuilder: (context, index) {
            final destination = _destinations[index];
            return DestinationListTile(destination: destination);
          },
        ),
      ],
    );
  }
}
