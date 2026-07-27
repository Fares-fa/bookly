import 'package:flutter/material.dart';

import 'package:bookly/src/shared/app_assets.dart';
import 'package:bookly/src/features/categories/venue/domain/venue_spec.dart';

/// The cafe's content, fed into the shared venue widgets.
///
/// Placeholder data from the mockups — swap for the venue API response when it
/// exists; nothing in the widget layer needs to change.
const cafeSpec = VenueSpec(
  name: 'Sky Roof Cafe',
  location: 'El ramel Station',
  rating: 9.5,
  ratingCount: '(20,052)',
  ratingLabel: 'Excellent',
  coverAsset: AppAssets.cafeImage,
  cardImageAsset: AppAssets.cafeImage,
  // No cafe-specific gallery shots yet — reusing the generic numbered photos.
  galleryAssets: [
    AppAssets.rest1,
    AppAssets.rest2,
    AppAssets.rest3,
    AppAssets.rest1,
    AppAssets.rest2,
  ],
  galleryOverflowLabel: '+150',
  pricePerPerson: '120EGP',
  depositPerPerson: '75EGP',
  aboutText: 'Sky Roof is a rooftop cafe offering panoramic sea views, '
      'making it a popular spot for morning coffee, catching up with '
      'friends, and quiet work sessions. The cafe combines a relaxed '
      'atmosphere with specialty coffee, fresh juices and desserts.',
  facilities: [
    VenueFacility(Icons.wifi, 'Fast Wifi'),
    VenueFacility(Icons.local_parking, 'Parking'),
    VenueFacility(Icons.ac_unit, 'Air Con..'),
    VenueFacility(Icons.laptop_mac, 'Work Space'),
  ],
  openingAt: '09:00 AM',
  closedAt: '02:00 AM',
  phone: '1999',
  distance: '0.5 KM',
  reviews: [
    VenueReview(
      name: 'Fares Abd Elrazek',
      rating: '9.5',
      comment: 'Amazing the best coffee in sharm el Shiekh',
    ),
    VenueReview(
      name: 'Mohamed el barawy',
      rating: '9.5',
      comment: 'Great desserts and a very calm atmosphere',
    ),
  ],
  seatingOptions: [
    SeatingOption.indoor,
    SeatingOption.outdoor,
    SeatingOption.terrace,
  ],
  subTotal: '150.00 EGP',
  fees: '10.00EGP',
  total: '160.00 EGP',
  remaining: '200EGP',
);
