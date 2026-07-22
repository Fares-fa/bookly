import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/home/presentation/providers/home_providers.dart';
import 'package:bookly/src/features/home/presentation/widgets/ad_banner_carousel.dart';

class AdSection extends ConsumerWidget {
  const AdSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncBanners = ref.watch(adBannersProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding, vertical: AppSpacing.md),
      child: asyncBanners.when(
        data: (banners) => banners.isEmpty ? const SizedBox.shrink() : AdBannerCarousel(banners: banners),
        loading: () => SkeletonWrapper(
          isLoading: true,
          child: Container(
            height: 180.h,
            decoration: const BoxDecoration(color: Colors.white, borderRadius: AppBorders.xl),
          ),
        ),
        error: (error, stackTrace) => AppErrorWidget(
          message: 'Could not load ads',
          onRetry: () => ref.invalidate(adBannersProvider),
        ),
      ),
    );
  }
}