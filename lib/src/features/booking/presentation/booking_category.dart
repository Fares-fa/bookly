import 'package:bookly/src/shared/app_assets.dart';

/// The service category being viewed on [MyBookingScreen].
enum BookingCategory {
  hotels,
  restaurants,
  cafes;

  String get label => switch (this) {
        BookingCategory.hotels => 'Hotels',
        BookingCategory.restaurants => 'Restaurant',
        BookingCategory.cafes => 'Cafe',
      };

  String get iconAsset => switch (this) {
        BookingCategory.hotels => AppAssets.bookingHotelsIcon,
        BookingCategory.restaurants => AppAssets.bookingRestaurantsIcon,
        BookingCategory.cafes => AppAssets.bookingCafeIcon,
      };
}
