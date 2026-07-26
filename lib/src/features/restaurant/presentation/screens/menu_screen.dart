import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/venue/presentation/widgets/venue_widgets.dart';

/// The restaurant's menu photo, opened from the "Menu" button on the detail
/// screen and in the booking wizard. Wrapped in an [InteractiveViewer] so the
/// small print on the menu stays readable.
class RestaurantMenuScreen extends StatelessWidget {
  const RestaurantMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: BookingAppBar(title: S.of(context).restaurantMenuTitle),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: InteractiveViewer(
          minScale: 1,
          maxScale: 4,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.asset(
              AppAssets.menu,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
