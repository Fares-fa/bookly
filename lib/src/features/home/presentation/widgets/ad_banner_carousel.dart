import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/home/domain/entities/ad_banner.dart';
import 'package:bookly/src/features/home/presentation/widgets/ad_banner_card.dart';

/// Swipeable ad carousel with a dot indicator overlaid on the card itself,
/// reusing the `smooth_page_indicator` dependency already in the project.
class AdBannerCarousel extends StatefulWidget {
  const AdBannerCarousel({super.key, required this.banners});

  final List<AdBanner> banners;

  @override
  State<AdBannerCarousel> createState() => _AdBannerCarouselState();
}

class _AdBannerCarouselState extends State<AdBannerCarousel> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: widget.banners.length,
            itemBuilder: (context, index) => AdBannerCard(banner: widget.banners[index]),
          ),
          Positioned(
            top: 105.h,
            left: 135.w,
            child: Container(
               padding: const EdgeInsets.symmetric(
              horizontal: 3,
            ),
              height: 11.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0x5C080808),
                borderRadius: BorderRadius.circular(41),
              ),
              // SmoothPageIndicator listens to the PageController itself, so
              // no manual page-index state/rebuild is needed here.
              child: SmoothPageIndicator(
                controller: _controller,
                count: widget.banners.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 6.h,
                  dotWidth: 6.w,
                  spacing: 2,
                  activeDotColor: const Color(0xFF0042D3),
                  dotColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}