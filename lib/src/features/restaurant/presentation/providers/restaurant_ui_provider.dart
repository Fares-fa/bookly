import 'package:bookly/src/features/venue/presentation/providers/venue_ui_state.dart';

/// Tab + favorite state for the restaurant detail screen.
///
/// Its own instance of the shared [VenueUiNotifier] so it stays independent of
/// the cafe's selection.
final VenueUiProvider restaurantUiProvider = VenueUiProvider(
  VenueUiNotifier.new,
);
