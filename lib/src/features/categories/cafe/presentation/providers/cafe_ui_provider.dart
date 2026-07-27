import 'package:bookly/src/features/categories/venue/presentation/providers/venue_ui_state.dart';

/// Tab + favorite state for the cafe detail screen.
///
/// Its own instance of the shared [VenueUiNotifier] so it stays independent of
/// the restaurant's selection.
final VenueUiProvider cafeUiProvider = VenueUiProvider(VenueUiNotifier.new);
