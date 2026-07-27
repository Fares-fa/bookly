import 'package:flutter/material.dart';

import 'package:bookly/src/shared/app_assets.dart';

import '../../venue/domain/venue_spec.dart';

/// The restaurant's content, fed into the shared venue widgets.
///
/// Placeholder data from the mockups — swap for the venue API response when it
/// exists; nothing in the widget layer needs to change.
const restaurantSpec = VenueSpec(
  name: 'Sky Roof Restaurant',
  location: 'El ramel Station',
  rating: 9.5,
  ratingCount: '(20,052)',
  ratingLabel: 'Excellent',
  coverAsset: AppAssets.cover,
  cardImageAsset: AppAssets.rest1,
  galleryAssets: [
    AppAssets.rest1,
    AppAssets.rest2,
    AppAssets.rest3,
    AppAssets.rest1,
    AppAssets.rest2,
  ],
  galleryOverflowLabel: '+150',
  pricePerPerson: '275EGP',
  depositPerPerson: '150EGP',
  aboutText: 'Sky Roof is a rooftop restaurant offering panoramic sea views, '
      'making it a popular destination for romantic dinners, gatherings '
      'with friends, and special occasions. The restaurant combines a '
      'relaxed atmosphere with international and seafood dishes.',
  facilities: [
    VenueFacility(Icons.local_parking, 'Parking'),
    VenueFacility(Icons.wifi, 'Fast Wifi'),
    VenueFacility(Icons.ac_unit, 'Air Con..'),
    VenueFacility(Icons.child_care, 'Kids Area'),
  ],
  openingAt: '09:00 PM',
  closedAt: '12:00 AM',
  phone: '1999',
  distance: '0.5 KM',
  reviews: [
    VenueReview(
      name: 'Fares Abd Elrazek',
      rating: '9.5',
      comment: 'Amazing the best in sharm el Shiekh',
    ),
    VenueReview(
      name: 'Mohamed el barawy',
      rating: '9.5',
      comment: 'Amazing the best in sharm el Shiekh',
    ),
  ],
  seatingOptions: [
    SeatingOption.indoor,
    SeatingOption.outdoor,
    SeatingOption.arena,
  ],
  subTotal: '300.00 EGP',
  fees: '10.00EGP',
  total: '310.00 EGP',
  remaining: '400EGP',
);
