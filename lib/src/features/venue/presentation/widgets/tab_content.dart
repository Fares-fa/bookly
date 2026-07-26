import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/venue/domain/venue_spec.dart';
import 'package:bookly/src/features/venue/presentation/providers/venue_ui_state.dart';
import 'package:bookly/src/features/venue/presentation/widgets/venue_widgets.dart';

/// Shows the section that matches the selected tab.
/// Index order mirrors [VenueTabContent.tabs]:
/// 0 About · 1 Policy · 2 Facilities · 3 Location · 4 Reviews.
class VenueTabContent extends ConsumerWidget {
  const VenueTabContent({
    super.key,
    required this.spec,
    required this.uiProvider,
  });

  /// The tab labels this content is indexed by — kept next to the switch below
  /// so the two can't fall out of sync.
  static const List<String> tabs = [
    'About',
    'Policy',
    'Facilities',
    'Location',
    'Reviews',
  ];

  final VenueSpec spec;
  final VenueUiProvider uiProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(uiProvider.select((s) => s.selectedTab));

    return switch (selected) {
      1 => VenuePolicySection(
          deposit: spec.depositPerPerson,
          openingAt: spec.openingAt,
          closedAt: spec.closedAt,
          phone: spec.phone,
        ),
      2 => VenueFacilitiesSection(facilities: spec.facilities),
      3 => VenueLocationSection(distance: spec.distance),
      4 => VenueReviewsSection(
          reviews: spec.reviews,
          rating: spec.rating,
          ratingCount: spec.ratingCount,
          ratingLabel: spec.ratingLabel,
        ),
      _ => VenueAboutSection(text: spec.aboutText),
    };
  }
}
