/// Centralized route path constants for GoRouter.
///
/// Use these variables instead of raw strings throughout the app.
/// Example: `context.go(AppRoutes.onboarding)` instead of `context.go('/')`.
abstract final class AppRoutes {
  AppRoutes._();

  static const String splash = '/splash';
  static const String home = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String completeInfo = '/complete-info';

  // Bottom-nav shell branches (see `AppShell`).
  static const String myBooking = '/my-booking';
  static const String favorites = '/favorites';
  static const String more = '/more';
  static const String categories = '/categories';
}
