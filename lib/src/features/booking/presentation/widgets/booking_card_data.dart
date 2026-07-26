import 'package:bookly/src/features/booking/presentation/booking_category.dart';

/// Data for a single [BookingCard].
class BookingCardData {
  const BookingCardData({
    required this.category,
    required this.image,
    required this.title,
    required this.dateRange,
    required this.guestsLabel,
    required this.location,
    required this.price,
    required this.nightsLabel,
  });

  /// Drives the small corner badge icon (the same icon shown in
  /// [BookingCategorySelector]).
  final BookingCategory category;

  final String image;
  final String title;
  final String dateRange;
  final String guestsLabel;
  final String location;
  final String price;
  final String nightsLabel;
}
