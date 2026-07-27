import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/categories/venue/domain/venue_spec.dart';
import 'package:bookly/src/features/categories/venue/presentation/providers/venue_ui_state.dart';
import 'package:bookly/src/features/categories/venue/presentation/widgets/venue_widgets.dart';

/// Hero: cover image with rounded bottom corners, top controls
/// (back / price / favorite) and the thumbnail gallery strip.
class VenueHeroSection extends ConsumerWidget {
  const VenueHeroSection({
    super.key,
    required this.spec,
    required this.uiProvider,
  });

  final VenueSpec spec;
  final VenueUiProvider uiProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topPad = MediaQuery.of(context).padding.top;
    final height = MediaQuery.of(context).size.height * 0.42;
    final isFav = ref.watch(uiProvider.select((s) => s.isFavorite));

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          // --- Hero image + gradient scrim ------------------------------
          Positioned.fill(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(spec.coverAsset, fit: BoxFit.cover),
                  // CSS: linear-gradient(360deg,
                  //   rgba(0,0,0,0) 0%, rgba(255,255,255,0.56) 75.68%)
                  // 360deg runs bottom → top, so the transparent stop sits at
                  // the bottom and white(56%) fills toward the top.
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.transparent,
                          Colors.white.withValues(alpha: 0.56),
                        ],
                        stops: const [0.0, 0.7568],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // --- Top controls: back / price / favorite --------------------
          Positioned(
            top: topPad + 8,
            left: 16,
            right: 16,
            child: Row(
              children: [
                CircleButtonPng(
                  name: AppAssets.back,
                  onTap: () => context.pop(),
                ),
                const Spacer(),
                PricePill(price: spec.pricePerPerson),
                const Spacer(),
                CircleButton(
                  name: AppAssets.heart,
                  iconColor: isFav ? AppColors.favorite : AppColors.white,
                  onTap: () => ref.read(uiProvider.notifier).toggleFavorite(),
                ),
              ],
            ),
          ),

          // --- Thumbnail gallery strip ----------------------------------
          Positioned(
            left: 32,
            right: 32,
            bottom: 20,
            child: VenueThumbnailStrip(
              assets: spec.galleryAssets,
              overflowLabel: spec.galleryOverflowLabel,
            ),
          ),
        ],
      ),
    );
  }
}
