import '../../imports/imports.dart';

/// Generic "title + horizontal card list" section backed by a
/// [FutureProvider], with built-in loading/empty/error states.
///
/// Powers the reusable Home sections ([NearbyPlacesSection], [TopRatedSection],
/// [LiveScreeningsSection]) and can back the same pattern on other screens by
/// passing a different [provider], [title], and [itemBuilder].
class AsyncCardSection<T> extends ConsumerWidget {
  const AsyncCardSection({
    super.key,
    required this.title,
    required this.provider,
    required this.itemBuilder,
    required this.emptyTitle,
    required this.errorMessage,
    this.trailing,
    this.cardWidth = 150,
    this.listHeight = 142,
  });

  final String title;
  final FutureProvider<List<T>> provider;
  final Widget Function(BuildContext context, T item, double width) itemBuilder;
  final String emptyTitle;
  final String errorMessage;
  final Widget? trailing;
  final double cardWidth;
  final double listHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncItems = ref.watch(provider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: title, trailing: trailing),
        asyncItems.when(
          data: (items) => items.isEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AppEmptyState(title: emptyTitle),
                )
              : HorizontalCardList(
                  height: listHeight.h,
                  itemCount: items.length,
                  itemExtent: cardWidth.w + AppSpacing.sm,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(right: AppSpacing.sm),
                    child: itemBuilder(context, items[index], cardWidth.w),
                  ),
                ),
          loading: () => SkeletonWrapper(
            isLoading: true,
            child: HorizontalCardList(
              height: listHeight.h,
              itemCount: 3,
              itemExtent: cardWidth.w + AppSpacing.sm,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(right: AppSpacing.sm),
                child: Container(
                  width: cardWidth.w,
                  decoration: const BoxDecoration(color: Colors.white, borderRadius: AppBorders.card),
                ),
              ),
            ),
          ),
          error: (error, stackTrace) => Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
            child: AppErrorWidget(
              message: errorMessage,
              onRetry: () => ref.invalidate(provider),
            ),
          ),
        ),
      ],
    );
  }
}