import 'package:bookly/src/imports/imports.dart';

/// White gallery strip of square thumbnails resting on the hero image.
/// The last thumbnail carries [overflowLabel] for the remaining photos.
class VenueThumbnailStrip extends StatelessWidget {
  const VenueThumbnailStrip({
    super.key,
    required this.assets,
    required this.overflowLabel,
  });

  final List<String> assets;
  final String overflowLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          for (var i = 0; i < assets.length; i++)
            _thumb(
              assets[i],
              overlayText: i == assets.length - 1 ? overflowLabel : null,
            ),
        ],
      ),
    );
  }

  Widget _thumb(String asset, {String? overlayText}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(asset, fit: BoxFit.cover),
                if (overlayText != null)
                  Container(
                    color: AppColors.scrimStrong,
                    alignment: Alignment.center,
                    child: Text(
                      overlayText,
                      style: AppTextStyle.thumbnailOverlay,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
