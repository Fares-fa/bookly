import 'package:bookly/src/features/place_details/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bookly/src/features/place_details/presentation/providers/place_details_ui_provider.dart';


/// Shows the section that matches the selected tab.
/// Index order mirrors `PlaceDetailsScreen.tabs`:
/// 0 About · 1 Policy · 2 Facilities · 3 Location · 4 Reviews.
class PlaceDetailsTabContent extends ConsumerWidget {
  const PlaceDetailsTabContent({
    super.key,
    required this.placeId,
    required this.aboutDescription,
  });

  final String placeId;
  final String aboutDescription;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref
        .watch(placeDetailsUiProvider(placeId).select((s) => s.selectedTab));

    final Widget section = switch (selected) {
      1 => const PolicySection(),
      2 => const FacilitiesSection(),
      3 => const LocationSection(),
      4 => const ReviewsSection(),
      _ => AboutSection(description: aboutDescription),
    };

    return section;
  }
}
