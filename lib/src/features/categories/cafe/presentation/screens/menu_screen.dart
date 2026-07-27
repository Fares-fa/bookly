import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/features/categories/venue/presentation/widgets/venue_widgets.dart';

/// The cafe's menu photo, opened from the "Menu" button on the detail screen
/// and in the booking wizard.
class CafeMenuScreen extends StatelessWidget {
  const CafeMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: BookingAppBar(title: S.of(context).cafeMenuTitle),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Image.asset(
            AppAssets.menu,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
