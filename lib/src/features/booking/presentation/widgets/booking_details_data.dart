import 'package:bookly/src/imports/imports.dart';

/// A single amenity chip shown on [BookingDetailsScreen] (e.g. "Wifi", "Tv").
class BookingAmenity {
  const BookingAmenity({required this.icon, required this.label});

  final IconData icon;
  final String label;
}

/// Full data for a booking's details screen: hotel summary, stay dates,
/// room info, and a payment breakdown.
class BookingDetailsData {
  const BookingDetailsData({
    required this.hotelLogo,
    required this.heroImage,
    required this.hotelName,
    required this.starRating,
    required this.reviewScore,
    required this.checkInDate,
    required this.checkInTime,
    required this.checkOutDate,
    required this.checkOutTime,
    required this.totalStayLabel,
    required this.roomType,
    required this.amenities,
    required this.inclusions,
    required this.subtotal,
    required this.fees,
    required this.totalAmount,
  });

  final String hotelLogo;
  final String heroImage;
  final String hotelName;
  final int starRating;
  final double reviewScore;

  final String checkInDate;
  final String checkInTime;
  final String checkOutDate;
  final String checkOutTime;
  final String totalStayLabel;

  final String roomType;
  final List<BookingAmenity> amenities;
  final List<String> inclusions;

  final String subtotal;
  final String fees;
  final String totalAmount;
}

/// Placeholder details matching [MyBookingScreen]'s placeholder booking,
/// used both to wire up navigation and as the router's fallback.
const kPlaceholderBookingDetails = BookingDetailsData(
  hotelLogo: AppAssets.favouritesHotel,
  heroImage: AppAssets.favouritesHotel,
  hotelName: 'Mövenpick resort sharm',
  starRating: 5,
  reviewScore: 9.5,
  checkInDate: '16 Feb 2026',
  checkInTime: 'From 02:00 PM',
  checkOutDate: '21 Feb 2026',
  checkOutTime: 'Until 12:00 PM',
  totalStayLabel: '5 Nights',
  roomType: 'Standard, Double, Sea View',
  amenities: [
    BookingAmenity(icon: Icons.bed_outlined, label: '1 Double'),
    BookingAmenity(icon: Icons.wifi, label: 'Wifi'),
    BookingAmenity(icon: Icons.ac_unit_outlined, label: 'Air Conditioner'),
    BookingAmenity(icon: Icons.tv_outlined, label: 'Tv'),
  ],
  inclusions: ['All Inclusive', 'Free Cancellation Until 25 Dec'],
  subtotal: 'EGP 96,415.00',
  fees: 'EGP 3,105.00',
  totalAmount: 'EGP 99,520.00',
);
