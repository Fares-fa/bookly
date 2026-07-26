import 'package:bookly/src/features/hotels/presentation/widgets/quick_filter_chip.dart';
import 'package:bookly/src/imports/imports.dart';

class HotelFiltersRow extends StatelessWidget {
  const HotelFiltersRow({
    super.key,
    required this.quickFilters,
    required this.selectedFilter,
    required this.onFilterSelected,
    required this.onFilterTap,
  });

  final List<String> quickFilters;
  final String selectedFilter;
  final ValueChanged<String> onFilterSelected;
  final VoidCallback onFilterTap;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    return Row(
      children: [
        GestureDetector(
          onTap: onFilterTap,
          child: Container(
              padding: EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(Icons.tune_rounded)),
        ),
        SizedBox(width: AppSpacing.sm.w),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final filter in quickFilters) ...[
                  QuickFilterChip(
                    label: filter,
                    selected: selectedFilter == filter,
                    onTap: () => onFilterSelected(filter),
                  ),
                  SizedBox(width: AppSpacing.sm.w),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
