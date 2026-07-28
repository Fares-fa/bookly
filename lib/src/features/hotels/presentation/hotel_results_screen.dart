import 'package:bookly/src/features/favorites/presentation/screens/favorite_category_screen.dart';
import 'package:bookly/src/features/favorites/presentation/widgets/hotel_card.dart';
import 'package:bookly/src/features/hotels/presentation/widgets/hotel_filters_row.dart';
import 'package:bookly/src/imports/imports.dart';

class HotelResultsScreen extends StatefulWidget {
  const HotelResultsScreen({super.key, required this.city});

  final String city;

  @override
  State<HotelResultsScreen> createState() => _HotelResultsScreenState();
}

class _HotelResultsScreenState extends State<HotelResultsScreen> {
  static const _quickFilters = ['Recommended', 'Cheapest', 'Area'];

  String _selectedFilter = _quickFilters.first;

  @override
  Widget build(BuildContext context) {
    final tt = context.textTheme;

    return BodyApp(
      onPressedArrowBack: () => GoRouter.of(context).pop(),
      txtCustomAppBar: widget.city,
      bodyOfContent: SafeArea(
        child: Column(
          children: [
            // SimpleHeader(title: widget.city),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.ms.w,
                vertical: AppSpacing.sm.h,
              ),
              child: AppTextField(
                fillColor: const Color(0xFFF9F9F9),
                hint: 'Search hotels in ${widget.city}',
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
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.ms.w),
              child: HotelFiltersRow(
                quickFilters: _quickFilters,
                selectedFilter: _selectedFilter,
                onFilterSelected: (filter) =>
                    setState(() => _selectedFilter = filter),
                onFilterTap: () {},
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(AppSpacing.ms.w),
                itemCount: placeholderHotels.length,
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSpacing.md.h),
                itemBuilder: (context, index) => HotelCard(
                  data: placeholderHotels[index],
                  onTap: () => context.push(
                    AppRoutes.hotelDetails,
                    extra: placeholderHotels[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
