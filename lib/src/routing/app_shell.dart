import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../shared/widgets/app_bottom_nav_bar.dart';

/// Persistent tab shell wrapping the Home / My Booking / Favorite / More
/// branches, wired up in `app_router.dart` via `StatefulShellRoute.indexedStack`.
///
/// Each branch keeps its own navigator alive in an `IndexedStack`, so
/// switching tabs preserves scroll position and in-progress state instead
/// of rebuilding the tab from scratch.
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),
    );
  }
}