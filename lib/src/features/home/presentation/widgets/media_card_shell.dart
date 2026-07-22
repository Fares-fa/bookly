import 'package:bookly/src/imports/imports.dart';

/// Displays a local asset image, falling back to a soft placeholder box
/// with an icon when the asset is missing or fails to decode.
///
/// Nearby Places / Live Screenings images are wired up to asset paths that
/// don't exist yet — real photos will be dropped in later — so this keeps
/// the layout looking intentional today and starts rendering real images
/// the moment those files are added, with no code changes required.
class HomeAssetImage extends StatelessWidget {
  const HomeAssetImage({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  final String assetPath;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    return Image.asset(
      assetPath,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => Container(
        width: width,
        height: height,
        color: cs.surfaceContainerHighest,
        alignment: Alignment.center,
        child: Icon(
          Icons.image_outlined,
          color: cs.onSurfaceVariant.withValues(alpha: 0.6),
          size: ((height ?? 96) * 0.32).clamp(20, 40),
        ),
      ),
    );
  }
}

/// A small dark pill showing a star rating, e.g. "★ 4.5".
class RatingBadge extends StatelessWidget {
  const RatingBadge({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xxs),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.55),
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(29),bottomRight: Radius.circular(10)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star_rounded, color: Colors.amber, size: 14.sp),
          SizedBox(width: 2.w),
          Text(
            rating.toStringAsFixed(1),
            style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

/// A small colored pill for a short status label (e.g. "Closed", "8 Seats left").
class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.label, required this.color, this.textColor});

  final String label;
  final Color color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xxs),
      decoration: BoxDecoration(color: color, borderRadius: AppBorders.full),
      child: Text(
        label,
        style: TextStyle(color: textColor ?? Colors.white, fontSize: 11.sp, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({required this.isFavorite, required this.onTap});

  final bool isFavorite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6.w),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.4),
          shape: BoxShape.circle,
        ),
        child: Icon(
          isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          color: isFavorite ? Colors.redAccent : Colors.white,
          size: 16.sp,
        ),
      ),
    );
  }
}

/// Shared visual chrome for Home's media cards (Nearby Places, Live
/// Screenings): an image with a top-left status badge and a top-right
/// favorite button, followed by a caption below.
///
/// Kept as a plain [StatelessWidget] with no Riverpod dependency, so
/// [NearbyPlaceCard]/[LiveScreeningCard] can watch favorite state themselves
/// (scoped via `.select`) and pass it down — this shell stays trivially
/// testable with fixture data alone.
class MediaCardShell extends StatelessWidget {
  const MediaCardShell({
    super.key,
    required this.imageAsset,
    required this.width,
    required this.imageHeight,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.caption,
    this.topLeftBadge,
    this.bottomRightBadge
  });

  final String imageAsset;
  final double width;
  final double imageHeight;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final Widget caption;
  final Widget? topLeftBadge;
  final Widget? bottomRightBadge;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width,
              height: imageHeight,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: HomeAssetImage(assetPath: imageAsset, width: width, height: imageHeight),
                    ),
                  ),
                  if (topLeftBadge != null) Positioned(left: 8.w, top: 8.h, child: topLeftBadge!),
                  if (bottomRightBadge != null) Positioned(right: 0, bottom: 0, child: bottomRightBadge!),
                  Positioned(
                    right: 8.w,
                    top: 8.h,
                    child: _FavoriteButton(isFavorite: isFavorite, onTap: onFavoriteToggle),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.sm),
            caption,
          ],
        ),
      ),
    );
  }
}