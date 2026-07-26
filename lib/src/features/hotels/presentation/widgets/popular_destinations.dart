import 'package:bookly/src/features/hotels/presentation/widgets/destination.dart';
import 'package:bookly/src/features/hotels/presentation/widgets/destination_card.dart';
import 'package:bookly/src/imports/imports.dart';

class PopularDestinations extends StatelessWidget {
  const PopularDestinations({super.key});

  static const _destinations = [
    Destination(city: 'Cairo', numberOfHotels: '1,050'),
    Destination(city: 'Mansoura', numberOfHotels: '500'),
    Destination(city: 'Sharm', numberOfHotels: '200'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 170,
        width: double.infinity,
        child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Popular Destinations',
                  style: context.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500)),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _destinations.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final destination = _destinations[index];
                    return DestinationCard(destination: destination);
                  },
                ),
              ),
            ]));
  }
}
