/// Centralized route path constants for GoRouter.
///
/// Use these variables instead of raw strings throughout the app.
/// Example: `context.go(AppRoutes.onboarding)` instead of `context.go('/')`.
abstract final class AppRoutes {
  AppRoutes._();

  static const String splash = '/splash';
  static const String home = '/';
  static const String onboarding = '/onboarding';
  static const String restaurant = '/restaurant';
  static const String bookingRestaurant = '/booking-restaurant';
  static const String bookTable = '/book-table';
  static const String partyDetails = '/party-details';
  static const String bookingSummary = '/booking-summary';
  static const String bookingConfirmed = '/booking-confirmed';
  static const String restaurantMenu = '/restaurant-menu';

  static const String cafe = '/cafe';
  static const String bookingCafe = '/booking-cafe';
  static const String cafeBookTable = '/cafe-book-table';
  static const String cafePartyDetails = '/cafe-party-details';
  static const String cafeBookingSummary = '/cafe-booking-summary';
  static const String cafeBookingConfirmed = '/cafe-booking-confirmed';
  static const String cafeMenu = '/cafe-menu';

  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String completeInfo = '/complete-info';
  static const String notifications = '/notifications';
  static const String favoriteCategory = '/favorite-category';
  static const String myFavorites = '/my-favorites';
  static const String myBooking = '/my-booking';
  static const String bookingDetails = '/booking-details';

  // Bottom-nav shell branches (see `AppShell`).
  static const String myBooking = '/my-booking';
  static const String favorites = '/favorites';
  static const String more = '/more';
  static const String categories = '/categories';
}
