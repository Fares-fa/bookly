import 'package:flutter_riverpod/flutter_riverpod.dart';

/// UI state for a venue detail screen: selected tab + favorite toggle.
class VenueUiState {
  const VenueUiState({this.selectedTab = 0, this.isFavorite = false});

  final int selectedTab;
  final bool isFavorite;

  VenueUiState copyWith({int? selectedTab, bool? isFavorite}) => VenueUiState(
        selectedTab: selectedTab ?? this.selectedTab,
        isFavorite: isFavorite ?? this.isFavorite,
      );
}

class VenueUiNotifier extends Notifier<VenueUiState> {
  @override
  VenueUiState build() => const VenueUiState();

  void selectTab(int index) => state = state.copyWith(selectedTab: index);
  void toggleFavorite() => state = state.copyWith(isFavorite: !state.isFavorite);
}

/// The provider type the shared venue widgets accept.
///
/// Each venue feature declares its own instance (see `restaurantUiProvider` /
/// `cafeUiProvider`) so their tab and favorite state stay independent.
typedef VenueUiProvider = NotifierProvider<VenueUiNotifier, VenueUiState>;
