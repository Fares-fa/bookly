import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bookly/src/features/restaurant/presentation/providers/restaurant_ui_provider.dart';
import 'package:bookly/src/theme/app_colors.dart';
import 'package:bookly/src/theme/app_text_style.dart';

/// Horizontally scrollable tab bar with an underline under the active tab.
class RestaurantTabBar extends ConsumerWidget {
  final List<String> tabs;
  const RestaurantTabBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(restaurantUiProvider).selectedTab;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(tabs.length, (i) {
          final isActive = i == selected;
          return GestureDetector(
            onTap: () => ref.read(restaurantUiProvider.notifier).selectTab(i),
            child: Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      tabs[i],
                      style: isActive ? AppTextStyle.tabActive : AppTextStyle.tab,
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 58,
                    decoration: BoxDecoration(
                      color: isActive ? AppColors.primary : Colors.transparent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
