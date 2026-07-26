import 'package:bookly/src/features/hotels/presentation/widgets/popular_destinations_list.dart';
import 'package:bookly/src/features/hotels/presentation/widgets/simple_header.dart';
import 'package:bookly/src/imports/imports.dart';

class HotelSearchScreen extends StatelessWidget {
  const HotelSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = context.textTheme;
    return Scaffold(
      backgroundColor: context.theme.colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            const SimpleHeader(title: 'Search'),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.md.w,
                vertical: AppSpacing.sm.h,
              ),
              child: AppTextField(
                autofocus: true,
                fillColor: const Color(0xFFF9F9F9),
                hint: 'Enter Your Destination',
                hintStyle: tt.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF666666)),
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(12),
                  child: VectorGraphic(
                    loader: AssetBytesLoader(AppAssets.search),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md.w),
              child: const PopularDestinationsList(),
            ),
          ],
        ),
      ),
    );
  }
}
