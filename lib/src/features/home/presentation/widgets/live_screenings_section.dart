import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/home/presentation/providers/home_providers.dart';
import 'package:bookly/src/features/home/presentation/widgets/section_header.dart';
import 'package:bookly/src/features/home/presentation/widgets/horizontal_card_list.dart';
import 'package:bookly/src/features/home/presentation/widgets/live_screening_card.dart';

class LiveScreeningsSection extends ConsumerWidget {
  const LiveScreeningsSection({super.key});

  static const double _cardWidth = 150;
  static const double _listHeight = 138;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncScreenings = ref.watch(liveScreeningsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Live Match Screenings'),
        asyncScreenings.when(
          data: (screenings) => screenings.isEmpty
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: AppEmptyState(title: 'No live screenings right now'),
                )
              : HorizontalCardList(
                  height: _listHeight.h,
                  itemCount: screenings.length,
                  itemExtent: _cardWidth.w + AppSpacing.sm,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(right: AppSpacing.sm),
                    child: LiveScreeningCard(screening: screenings[index], width: _cardWidth.w),
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
              message: 'Could not load live screenings',
              onRetry: () => ref.invalidate(liveScreeningsProvider),
            ),
          ),
        ),
      ],
    );
  }
}