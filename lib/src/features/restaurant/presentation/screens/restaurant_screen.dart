import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bookly/src/theme/app_colors.dart';

import '../widgets/widgets.dart';

class RestaurantScreen extends ConsumerWidget {
  const RestaurantScreen({super.key});

  static const _tabs = ['About', 'Policy', 'Facilities', 'Location', 'Reviews'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Fixed hero — stays pinned while the content below scrolls.
          HeroSection(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleRow(),
                  SizedBox(height: 6),

                  LocationRow(),
                  SizedBox(height: 12),
                  RestaurantTabBar(tabs: _tabs),
                  Divider(height: 1, thickness: 1, color: AppColors.divider),
                  SizedBox(height: 12),

                  RestaurantTabContent(),
                  SizedBox(height: 10),

                ],
              ),
            ),
          ),
          BottomBar(),
        ],
      ),
    );
  }
}
