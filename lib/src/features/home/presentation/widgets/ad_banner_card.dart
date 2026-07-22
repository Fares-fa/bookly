import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/home/domain/entities/ad_banner.dart';

/// A single ad banner: full-bleed background photo, a left-to-right blue
/// gradient for text legibility, offer copy, and a CTA button.
class AdBannerCard extends StatelessWidget {
  const AdBannerCard({super.key, required this.banner});

  final AdBanner banner;

  @override
  Widget build(BuildContext context) {
    final warning = context.appColors.warning;

    return RepaintBoundary(
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            AppAssetImage(assetPath: banner.imageAsset),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    const Color(0xFF0042D3).withValues(alpha: 0.95),
                    const Color(0xFF0042D3).withValues(alpha: 0.55),
                    const Color(0xFF0042D3).withValues(alpha: 0),
                  ],
                  stops: const [0.0, 0.45, 0.75],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: FractionallySizedBox(
                widthFactor:1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      banner.title,
                      style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      banner.highlight,
                      style: TextStyle(color: warning, fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: AppSpacing.xxs),
                    Text(
                      banner.subtitle,
                      style: TextStyle(color: Colors.white, fontSize: 11.sp,fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: AppSpacing.ms),
                    AppButton(
                      label: banner.ctaLabel,
                      onPressed: () {},
                      color: warning,
                      textColor: Colors.white,
                      height: ButtonSize.small,
                      customWidth: 110,
                      customHeight: 26,
                      labelFontWeight: FontWeight.w400,
                      borderRadius: BorderRadius.circular(28),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}