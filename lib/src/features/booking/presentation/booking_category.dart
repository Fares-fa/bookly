import 'package:flutter/widgets.dart';

import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/shared/app_assets.dart';

/// The service category being viewed on [MyBookingScreen].
enum BookingCategory {
  hotels,
  restaurants,
  cafes;

  String label(BuildContext context) => switch (this) {
        BookingCategory.hotels => S.of(context).bookingCategoryHotels,
        BookingCategory.restaurants => S.of(context).bookingCategoryRestaurant,
        BookingCategory.cafes => S.of(context).bookingCategoryCafe,
      };

  String get iconAsset => switch (this) {
        BookingCategory.hotels => AppAssets.bookingHotelsIcon,
        BookingCategory.restaurants => AppAssets.bookingRestaurantsIcon,
        BookingCategory.cafes => AppAssets.bookingCafeIcon,
      };
}
