import 'package:flutter/material.dart';

import 'package:bookly/src/features/place_details/presentation/screens/place_details_screen.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceDetailsScreen(
      placeId: 'restaurant-sky-roof',
      title: 'Sky Roof Restaurant',
      location: 'El ramel Station',
    );
  }
}
