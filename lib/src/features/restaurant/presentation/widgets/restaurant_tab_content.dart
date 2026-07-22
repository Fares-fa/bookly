import 'package:bookly/src/features/restaurant/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bookly/src/features/restaurant/presentation/providers/restaurant_ui_provider.dart';


/// Shows the section that matches the selected tab.
/// Index order mirrors `RestaurantScreen._tabs`:
/// 0 About · 1 Policy · 2 Facilities · 3 Location · 4 Reviews.
class RestaurantTabContent extends ConsumerWidget {
  const RestaurantTabContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected =
        ref.watch(restaurantUiProvider.select((s) => s.selectedTab));

    final Widget section = switch (selected) {
      1 => const PolicySection(),
      2 => const FacilitiesSection(),
      3 => const LocationSection(),
      4 => const ReviewsSection(),
      _ => const AboutSection(),
    };

    return section;
  }
}
