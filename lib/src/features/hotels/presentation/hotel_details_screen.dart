import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:bookly/src/features/favorites/presentation/widgets/hotel_card_data.dart';
import 'package:bookly/src/features/place_details/presentation/screens/place_details_screen.dart';
import 'package:bookly/src/features/place_details/presentation/widgets/price_nights_box.dart';
import 'package:bookly/src/routing/app_routes.dart';

/// Details screen for a hotel selected from [HotelResultsScreen], reusing
/// the shared [PlaceDetailsScreen] used by the restaurant details screen.
class HotelDetailsScreen extends StatelessWidget {
  const HotelDetailsScreen({super.key, required this.data});

  final HotelCardData data;

  @override
  Widget build(BuildContext context) {
    return PlaceDetailsScreen(
      placeId: 'hotel-${data.name}',
      title: data.name,
      location: data.location,
      rating: data.score.toString(),
      // priceLabel: data.price != null ? 'Price : ${data.price}' : null,
      coverAsset: data.mainImage,
      aboutDescription: '${data.name} is located in ${data.location}, '
          'offering comfortable rooms and modern amenities for a pleasant stay.',
      secondaryWidget: PriceNightsBox(
        price: data.price,
        numberOfNights: data.numberOfNights,
        isHotel: true,
      ),
      ctaIcon: Icons.meeting_room_outlined,
      ctaLabel: 'Choose Room',
      onCtaTap: () => context.push(AppRoutes.hotelRooms, extra: data),
      currentStep: 1,
      totalSteps: 4,
    );
  }
}
