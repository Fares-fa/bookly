import 'package:bookly/src/imports/imports.dart';

/// Shared app bar for the booking-wizard screens: a blue circular back button
/// on the left and an optional centered [title]. Matching the mockups, the
/// party-details step passes no title (just the back control).
class BookingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BookingAppBar({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      centerTitle: true,
      titleSpacing: 0,
      leadingWidth: 64.w,
      leading: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: AppSpacing.pagePadding),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 28.w,
              height: 28.h,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.chevron_left_rounded,
                color: AppColors.white,
                size: 24.w,
              ),
            ),
          ),
        ),
      ),
      title: title == null
          ? null
          : Text(title!, style: AppTextStyle.blackW500Size16),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
