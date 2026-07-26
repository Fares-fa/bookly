import 'package:bookly/src/features/hotels/presentation/widgets/popular_destinations_list.dart';
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
            _HotelSearchHeader(),
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

class _HotelSearchHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md.w, vertical: AppSpacing.sm.h),
      child: SizedBox(
        height: 40.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              'Search',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: cs.onSurface),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  if (context.canPop()) context.pop();
                },
                child: Container(
                  width: 40.w,
                  height: 40.w,
                  decoration:
                      BoxDecoration(color: cs.primary, shape: BoxShape.circle),
                  child: const Icon(Icons.chevron_left, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
