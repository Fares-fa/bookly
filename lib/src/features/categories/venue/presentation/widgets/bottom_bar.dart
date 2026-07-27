import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/imports/imports.dart';

/// Pinned bottom action bar on the venue detail screen: circular Menu button
/// + "Book Table" CTA.
class VenueBottomBar extends StatelessWidget {
  const VenueBottomBar({
    super.key,
    required this.menuRoute,
    required this.bookRoute,
    this.menuIcon = Icons.room_service_outlined,
    this.label,
  });

  final String menuRoute;
  final String bookRoute;

  /// Cutlery for a restaurant, a cup for a cafe.
  final IconData menuIcon;

  /// Falls back to the localized "Book Table" label when not provided.
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.fromLTRB(
        20,
        16,
        20,
        16 + MediaQuery.of(context).padding.bottom,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.push(menuRoute),
            child: Container(
              width: 66,
              height: 66,
              decoration: const BoxDecoration(
                color: AppColors.menuBg,
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(menuIcon, color: AppColors.primary, size: 24),
                  const SizedBox(height: 2),
                  Text(S.of(context).venueMenuLabel, style: AppTextStyle.primaryW500Size9),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: SizedBox(
              height: 66,
              child: ElevatedButton(
                onPressed: () => context.push(bookRoute),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(33),
                  ),
                ),
                child: Text(
                  label ?? S.of(context).venueBookTableButton,
                  style: AppTextStyle.whiteW500Size16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
