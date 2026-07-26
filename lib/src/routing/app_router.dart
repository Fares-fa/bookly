import 'package:bookly/src/features/complete_info/presentation/completeInfo.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookly/src/routing/global_navigator.dart';
import 'package:bookly/src/routing/app_routes.dart';
import 'package:bookly/src/routing/app_shell.dart';

import 'package:bookly/src/features/auth/presentation/screens/login_screen.dart';
import 'package:bookly/src/features/auth/presentation/screens/signup_screen.dart';
import 'package:bookly/src/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:bookly/src/features/auth/presentation/providers/session_provider.dart';

import 'package:bookly/src/features/restaurant/presentation/screens/restaurant_screen.dart';
import 'package:bookly/src/features/restaurant/presentation/screens/booking_restaurant.dart';
import 'package:bookly/src/features/restaurant/presentation/screens/book_table_screen.dart';
import 'package:bookly/src/features/restaurant/presentation/screens/party_details_screen.dart';
import 'package:bookly/src/features/restaurant/presentation/screens/booking_summary_screen.dart';
import 'package:bookly/src/features/cafe/presentation/screens/cafe_screen.dart';
import 'package:bookly/src/features/cafe/presentation/screens/booking_cafe.dart';
import 'package:bookly/src/features/cafe/presentation/screens/book_table_screen.dart';
import 'package:bookly/src/features/cafe/presentation/screens/party_details_screen.dart';
import 'package:bookly/src/features/cafe/presentation/screens/booking_summary_screen.dart';
import 'package:bookly/src/features/restaurant/presentation/screens/menu_screen.dart';
import 'package:bookly/src/features/cafe/presentation/screens/menu_screen.dart';
import 'package:bookly/src/features/restaurant/presentation/screens/booking_confirmed_screen.dart';
import 'package:bookly/src/features/cafe/presentation/screens/booking_confirmed_screen.dart';
import 'package:bookly/src/features/home/presentation/screens/home_page.dart';
import 'package:bookly/src/features/home/presentation/screens/categories_screen.dart';
import 'package:bookly/src/features/booking/presentation/screens/my_booking_page.dart';
import 'package:bookly/src/features/more/presentation/screens/more_page.dart';
import 'package:bookly/src/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:bookly/src/features/splash/presentation/screens/splash_screen.dart';
import 'package:bookly/src/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:bookly/src/features/favorites/presentation/favorite_category.dart';
import 'package:bookly/src/features/favorites/presentation/screens/favorite_category_screen.dart';
import 'package:bookly/src/features/favorites/presentation/screens/my_favorites_screen.dart';

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.splash,
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.splash,
      name: 'splash',
      builder: (context, state) => Consumer(
        builder: (context, ref, _) => SplashScreen(
          onFinished: () {
            // TODO: Also account for an onboarding-seen check once that
            // exists, to distinguish first-run onboarding from login.
            final status = ref.read(sessionProvider).status;
            rootContext?.go(
              status == SessionStatus.authenticated
                  ? AppRoutes.home
                  : AppRoutes.onboarding,
            );
          },
        ),
      ),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      name: 'onboarding',
      builder: (context, state) => OnboardingScreen(
        // TODO: Persist an "onboarding seen" flag here once that exists.
        onFinished: () => rootContext?.go(AppRoutes.login),
        onGuest: () => rootContext?.go(AppRoutes.home),
      ),
    ),
    GoRoute(
      path: AppRoutes.login,
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.signup,
      name: 'signup',
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: AppRoutes.forgotPassword,
      name: 'forgotPassword',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: AppRoutes.restaurant,
      name: 'restaurant',
      builder: (context, state) => const RestaurantScreen(),
    ),
    GoRoute(
      path: AppRoutes.bookingRestaurant,
      name: 'bookingRestaurant',
      builder: (context, state) => const BookingRestaurant(),
    ),
    GoRoute(
      path: AppRoutes.bookTable,
      name: 'bookTable',
      builder: (context, state) => const BookTableScreen(),
    ),
    GoRoute(
      path: AppRoutes.partyDetails,
      name: 'partyDetails',
      builder: (context, state) => const PartyDetailsScreen(),
    ),
    GoRoute(
      path: AppRoutes.bookingSummary,
      name: 'bookingSummary',
      builder: (context, state) => const BookingSummaryScreen(),
    ),
    GoRoute(
      path: AppRoutes.bookingConfirmed,
      name: 'bookingConfirmed',
      builder: (context, state) => const BookingConfirmedScreen(),
    ),
    GoRoute(
      path: AppRoutes.restaurantMenu,
      name: 'restaurantMenu',
      builder: (context, state) => const RestaurantMenuScreen(),
    ),
    GoRoute(
      path: AppRoutes.cafe,
      name: 'cafe',
      builder: (context, state) => const CafeScreen(),
    ),
    GoRoute(
      path: AppRoutes.bookingCafe,
      name: 'bookingCafe',
      builder: (context, state) => const BookingCafe(),
    ),
    GoRoute(
      path: AppRoutes.cafeBookTable,
      name: 'cafeBookTable',
      builder: (context, state) => const CafeBookTableScreen(),
    ),
    GoRoute(
      path: AppRoutes.cafePartyDetails,
      name: 'cafePartyDetails',
      builder: (context, state) => const CafePartyDetailsScreen(),
    ),
    GoRoute(
      path: AppRoutes.cafeBookingSummary,
      name: 'cafeBookingSummary',
      builder: (context, state) => const CafeBookingSummaryScreen(),
    ),
    GoRoute(
      path: AppRoutes.cafeBookingConfirmed,
      name: 'cafeBookingConfirmed',
      builder: (context, state) => const CafeBookingConfirmedScreen(),
    ),
    GoRoute(
      path: AppRoutes.cafeMenu,
      name: 'cafeMenu',
      builder: (context, state) => const CafeMenuScreen(),
    ),
    GoRoute(
      path: AppRoutes.categories,
      name: 'categories',
      builder: (context, state) => const CategoriesScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => AppShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home,
              name: 'home',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.myBooking,
              name: 'myBooking',
              builder: (context, state) => const MyBookingPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.favorites,
              name: 'favorites',
              builder: (context, state) => const MyFavoritesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.more,
              name: 'more',
              builder: (context, state) => const MorePage(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.completeInfo,
      name: 'complete-info',
      builder: (context, state) => const CompleteInfo(),
    ),
    GoRoute(
      path: AppRoutes.notifications,
      name: 'notifications',
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      path: AppRoutes.favoriteCategory,
      name: 'favorite-category',
      builder: (context, state) => FavoriteCategoryScreen(
        category: (state.extra as FavoriteCategory?) ?? FavoriteCategory.hotels,
      ),
    ),
    GoRoute(
      path: AppRoutes.myFavorites,
      name: 'my-favorites',
      builder: (context, state) => const MyFavoritesScreen(),
    ),
  ],
);
