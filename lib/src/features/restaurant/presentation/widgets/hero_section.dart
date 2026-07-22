import 'package:bookly/src/features/restaurant/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bookly/src/features/restaurant/presentation/providers/restaurant_ui_provider.dart';

import 'package:bookly/src/theme/app_colors.dart';
import 'package:bookly/src/imports/core_imports.dart';



/// Hero: cover image with rounded bottom corners, top controls
/// (back / price / favorite) and the thumbnail gallery strip.
class HeroSection extends ConsumerWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topPad = MediaQuery.of(context).padding.top;
    final height = MediaQuery.of(context).size.height * 0.42;
    final isFav = ref.watch(restaurantUiProvider).isFavorite;

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
                    AppAssets.cover,
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
                  name: AppAssets.back,
                  onTap: () {},
                ),
                const Spacer(),
                const PricePill(),
                const Spacer(),
                CircleButton(
                  name: isFav ?AppAssets.heart : AppAssets.heart,
                  iconColor: isFav ? AppColors.favorite : AppColors.white,
                  onTap: () =>
                      ref.read(restaurantUiProvider.notifier).toggleFavorite(),
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
