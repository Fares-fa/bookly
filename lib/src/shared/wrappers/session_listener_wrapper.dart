import 'package:bookly/src/imports/core_imports.dart';
import 'package:bookly/src/imports/packages_imports.dart';

import 'package:bookly/src/features/auth/presentation/providers/session_provider.dart';


class SessionListenerWrapper extends ConsumerWidget {
  final Widget child;
  const SessionListenerWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SessionState>(sessionProvider, (prev, next) {
      // The initial unknown -> resolved transition is decided by SplashScreen
      // itself once its own animation finishes (see the splash route's
      // onFinished in app_router.dart). This listener only reacts to session
      // changes that happen afterwards — e.g. a login or logout once the app
      // is already past splash — so it doesn't race the splash animation.
      final isInitialResolution = prev == null || prev.status == SessionStatus.unknown;
      if (isInitialResolution || next.status == SessionStatus.unknown) return;

      // `context` here comes from MaterialApp.router's `builder`, which sits
      // above the Router — GoRouter.of(context) (used by context.go) throws
      // "No GoRouter found in context" from this position. `rootContext`
      // (the root Navigator's context) is below the Router, so use that.
      if (next.status == SessionStatus.authenticated) {
        rootContext?.go(AppRoutes.home);
      } else {
        rootContext?.go(AppRoutes.onboarding);
      }
    });

    return child;
  }
}
