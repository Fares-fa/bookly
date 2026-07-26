import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/venue/presentation/providers/venue_ui_state.dart';

/// Horizontally scrollable tab bar with an underline under the active tab.
///
/// [uiProvider] is injected so restaurant and cafe keep independent selection.
class VenueTabBar extends ConsumerWidget {
  const VenueTabBar({
    super.key,
    required this.tabs,
    required this.uiProvider,
  });

  final List<String> tabs;
  final VenueUiProvider uiProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(uiProvider.select((s) => s.selectedTab));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(tabs.length, (i) {
          final isActive = i == selected;
          return GestureDetector(
            onTap: () => ref.read(uiProvider.notifier).selectTab(i),
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
                      style:
                          isActive ? AppTextStyle.tabActive : AppTextStyle.tab,
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
