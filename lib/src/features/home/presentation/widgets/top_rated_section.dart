import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/home/presentation/providers/home_providers.dart';
import 'package:bookly/src/features/home/presentation/widgets/section_header.dart';
import 'package:bookly/src/features/home/presentation/widgets/home_filter_chip.dart';
import 'package:bookly/src/features/home/presentation/widgets/horizontal_card_list.dart';
import 'package:bookly/src/features/home/presentation/widgets/nearby_place_card.dart';

class TopRatedSection extends ConsumerWidget {
  const TopRatedSection({super.key});

  static const double _cardWidth = 150;
  static const double _listHeight = 142;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPlaces = ref.watch(nearbyPlacesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Top Rated Places',
          trailing: HomeFilterChip(label: 'All', onTap: () => context.showSnackBar('Filters coming soon')),
        ),
        asyncPlaces.when(
          data: (places) => places.isEmpty
              ? const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: AppEmptyState(title: 'No nearby places found'),
          )
              : HorizontalCardList(
            height: _listHeight.h,
            itemCount: places.length,
            itemExtent: _cardWidth.w + AppSpacing.sm,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(right: AppSpacing.sm),
              child: NearbyPlaceCard(place: places[index], width: _cardWidth.w),
            ),
          ),
          loading: () => SkeletonWrapper(
            isLoading: true,
            child: HorizontalCardList(
              height: _listHeight.h,
              itemCount: 3,
              itemExtent: _cardWidth.w + AppSpacing.sm,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(right: AppSpacing.sm),
                child: Container(
                  width: _cardWidth.w,
                  decoration: const BoxDecoration(color: Colors.white, borderRadius: AppBorders.card),
                ),
              ),
            ),
          ),
          error: (error, stackTrace) => Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
            child: AppErrorWidget(
              message: 'Could not load nearby places',
              onRetry: () => ref.invalidate(nearbyPlacesProvider),
            ),
          ),
        ),
      ],
    );
  }
}