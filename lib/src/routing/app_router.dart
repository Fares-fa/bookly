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


final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.splash,
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
              status == SessionStatus.authenticated ? AppRoutes.home : AppRoutes.onboarding,
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
  ],
);
