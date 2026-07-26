import 'package:flutter/widgets.dart';

/// Seating area offered by a venue, chosen on the "How Many People?" step.
///
/// The full set lives here; each venue picks the subset it actually offers via
/// [VenueSpec.seatingOptions].
enum SeatingOption {
  indoor('In door'),
  outdoor('Out door'),
  arena('Arena'),
  terrace('Terrace');

  const SeatingOption(this.label);

  /// Human-readable label used on the option pill and the summary row.
  final String label;
}

/// One amenity row in the "Facilities" tab.
class VenueFacility {
  const VenueFacility(this.icon, this.label);

  final IconData icon;
  final String label;
}

/// One entry in the "Reviews" tab.
class VenueReview {
  const VenueReview({
    required this.name,
    required this.rating,
    required this.comment,
  });

  final String name;
  final String rating;
  final String comment;
}

/// Everything the shared venue widgets need to render a specific venue.
///
/// Restaurant and cafe keep their own screens and providers, but both feed the
/// same widget set — the only difference between them is the [VenueSpec] they
/// pass down. Replace the `const` specs with API-backed data when the venue
/// endpoint lands.
class VenueSpec {
  const VenueSpec({
    required this.name,
    required this.location,
    required this.rating,
    required this.ratingCount,
    required this.ratingLabel,
    required this.coverAsset,
    required this.cardImageAsset,
    required this.galleryAssets,
    required this.galleryOverflowLabel,
    required this.pricePerPerson,
    required this.depositPerPerson,
    required this.aboutText,
    required this.facilities,
    required this.openingAt,
    required this.closedAt,
    required this.phone,
    required this.distance,
    required this.reviews,
    required this.seatingOptions,
    required this.subTotal,
    required this.fees,
    required this.total,
    required this.remaining,
  });

  final String name;
  final String location;

  /// Score shown in the title badge, e.g. `9.5`.
  final double rating;

  /// Formatted review count for the Reviews heading, e.g. `(20,052)`.
  final String ratingCount;

  /// Qualitative label next to the score badge, e.g. `Excellent`.
  final String ratingLabel;

  final String coverAsset;

  /// Thumbnail used by the compact card on the booking-wizard steps.
  final String cardImageAsset;

  /// Photos in the hero's thumbnail strip.
  final List<String> galleryAssets;

  /// Overlay on the last thumbnail, e.g. `+150`.
  final String galleryOverflowLabel;

  /// Formatted price, e.g. `275EGP`.
  final String pricePerPerson;

  /// Formatted deposit shown in the Policy tab, e.g. `150EGP`.
  final String depositPerPerson;

  final String aboutText;
  final List<VenueFacility> facilities;
  final String openingAt;
  final String closedAt;
  final String phone;

  /// Distance from the user, e.g. `0.5 KM`.
  final String distance;

  final List<VenueReview> reviews;

  /// Seating areas this venue offers.
  final List<SeatingOption> seatingOptions;

  // ── Payment placeholders (until the pricing API exists) ───────────────────
  final String subTotal;
  final String fees;
  final String total;

  /// Balance due on arrival, shown on the booking-summary card.
  final String remaining;
}
