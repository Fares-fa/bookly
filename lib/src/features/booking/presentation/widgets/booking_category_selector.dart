import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/booking/presentation/booking_category.dart';

/// Horizontal scrollable pill selector for [BookingCategory].
class BookingCategorySelector extends StatelessWidget {
  const BookingCategorySelector({super.key, required this.selected, required this.onChanged});

  final BookingCategory selected;
  final ValueChanged<BookingCategory> onChanged;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: BookingCategory.values.length,
        separatorBuilder: (context, index) => SizedBox(width: AppSpacing.sm.w),
        itemBuilder: (context, index) {
          final category = BookingCategory.values[index];
          final isSelected = category == selected;

          return GestureDetector(
            onTap: () => onChanged(category),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md.w),
              decoration: BoxDecoration(
                color: isSelected ? cs.primaryContainer : Colors.white,
                borderRadius: AppBorders.full,
                boxShadow: isSelected ? null : AppShadows.subtle,
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonImage(imageUrl: category.iconAsset, width: 22, height: 22),
                  SizedBox(width: AppSpacing.xs.w),
                  Text(
                    category.label,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? cs.onPrimaryContainer : cs.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
