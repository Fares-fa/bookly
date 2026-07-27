import 'package:bookly/src/features/place_details/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bookly/src/features/place_details/presentation/providers/place_details_ui_provider.dart';

import 'package:bookly/src/imports/core_imports.dart';
import 'package:go_router/go_router.dart';

/// Hero: cover image with rounded bottom corners, top controls
/// (back / price / favorite) and the thumbnail gallery strip.
class HeroSection extends ConsumerWidget {
  const HeroSection({
    super.key,
    required this.placeId,
    this.coverAsset,
    this.priceLabel,
  });

  final String placeId;
  final String? coverAsset;
  final String? priceLabel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topPad = MediaQuery.of(context).padding.top;
    final height = MediaQuery.of(context).size.height * 0.42;
    final isFav = ref.watch(placeDetailsUiProvider(placeId)).isFavorite;

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
                  Image.asset(
                    coverAsset ?? AppAssets.cover,
                    fit: BoxFit.cover,
                  ),
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
                CircleButton(
                  iconColor: Colors.white,
                  isPng: true,
                  name: AppAssets.back,
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                ),
                const Spacer(),
                if (priceLabel != null && priceLabel!.isNotEmpty)
                  PricePill(label: priceLabel ?? 'Price : 275EGP'),
                const Spacer(),
                CircleButton(
                  name: isFav ? AppAssets.heart : AppAssets.heart,
                  iconColor: isFav ? AppColors.favorite : AppColors.white,
                  onTap: () => ref
                      .read(placeDetailsUiProvider(placeId).notifier)
                      .toggleFavorite(),
                ),
              ],
            ),
          ),

          // --- Thumbnail gallery strip ----------------------------------
          const Positioned(
            left: 32,
            right: 32,
            bottom: 20,
            child: ThumbnailStrip(),
          ),
        ],
      ),
    );
  }
}
