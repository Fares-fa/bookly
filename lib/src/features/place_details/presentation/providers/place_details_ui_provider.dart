import 'package:flutter_riverpod/flutter_riverpod.dart';

/// UI state for a place details screen (restaurant or hotel):
/// selected tab + favorite toggle.
class PlaceDetailsUiState {
  final int selectedTab;
  final bool isFavorite;
  const PlaceDetailsUiState({this.selectedTab = 0, this.isFavorite = false});

  PlaceDetailsUiState copyWith({int? selectedTab, bool? isFavorite}) =>
      PlaceDetailsUiState(
        selectedTab: selectedTab ?? this.selectedTab,
        isFavorite: isFavorite ?? this.isFavorite,
      );
}

class PlaceDetailsUiNotifier extends Notifier<PlaceDetailsUiState> {
  @override
  PlaceDetailsUiState build() => const PlaceDetailsUiState();

  void selectTab(int index) => state = state.copyWith(selectedTab: index);
  void toggleFavorite() =>
      state = state.copyWith(isFavorite: !state.isFavorite);
}

/// Keyed by a `placeId` so each restaurant/hotel details screen keeps its
/// own selected tab and favorite state instead of sharing one global state.
final placeDetailsUiProvider = NotifierProvider.family<PlaceDetailsUiNotifier,
    PlaceDetailsUiState, String>(
  (placeId) => PlaceDetailsUiNotifier(),
);
