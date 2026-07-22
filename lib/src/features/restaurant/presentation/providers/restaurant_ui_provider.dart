import 'package:flutter_riverpod/flutter_riverpod.dart';

/// UI state for the restaurant screen: selected tab + favorite toggle.
class RestaurantUiState {
  final int selectedTab;
  final bool isFavorite;
  const RestaurantUiState({this.selectedTab = 0, this.isFavorite = false});

  RestaurantUiState copyWith({int? selectedTab, bool? isFavorite}) =>
      RestaurantUiState(
        selectedTab: selectedTab ?? this.selectedTab,
        isFavorite: isFavorite ?? this.isFavorite,
      );
}

class RestaurantUiNotifier extends Notifier<RestaurantUiState> {
  @override
  RestaurantUiState build() => const RestaurantUiState();

  void selectTab(int index) => state = state.copyWith(selectedTab: index);
  void toggleFavorite() => state = state.copyWith(isFavorite: !state.isFavorite);
}

final restaurantUiProvider =
    NotifierProvider<RestaurantUiNotifier, RestaurantUiState>(
  RestaurantUiNotifier.new,
);
