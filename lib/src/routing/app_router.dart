import 'package:bookly/src/features/complete_info/presentation/completeInfo.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookly/src/routing/global_navigator.dart';
import 'package:bookly/src/routing/app_routes.dart';

import 'package:bookly/src/features/auth/presentation/screens/login_screen.dart';
import 'package:bookly/src/features/auth/presentation/screens/signup_screen.dart';
import 'package:bookly/src/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:bookly/src/features/auth/presentation/providers/session_provider.dart';

import 'package:bookly/src/features/home/presentation/screens/home_page.dart';
import 'package:bookly/src/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:bookly/src/features/splash/presentation/screens/splash_screen.dart';
import 'package:bookly/src/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:bookly/src/features/favorites/presentation/favorite_category.dart';
import 'package:bookly/src/features/favorites/presentation/screens/favorite_category_screen.dart';
import 'package:bookly/src/features/favorites/presentation/screens/my_favorites_screen.dart';
import 'package:bookly/src/features/booking/presentation/screens/my_booking_screen.dart';

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
      path: AppRoutes.home,
      name: 'home',
      builder: (context, state) => const HomePage(),
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
    GoRoute(
      path: AppRoutes.myBooking,
      name: 'my-booking',
      builder: (context, state) => const MyBookingScreen(),
    ),
  ],
);
