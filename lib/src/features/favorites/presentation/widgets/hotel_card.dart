import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/favorites/presentation/widgets/hotel_card_data.dart';
import 'package:bookly/src/features/favorites/presentation/widgets/hotel_gallery.dart';
import 'package:bookly/src/features/favorites/presentation/widgets/hotel_score_badge.dart';

export 'package:bookly/src/features/favorites/presentation/widgets/hotel_card_data.dart';

/// A hotel summary card: logo, name and star rating, a 3-photo gallery,
/// a score badge, location, and a list of highlighted features.
///
/// Usage:
/// ```dart
/// HotelCard(
///   data: hotel,
///   onTap: () => context.push('/hotels/${hotel.id}'),
/// )
/// ```
class HotelCard extends StatelessWidget {
  const HotelCard({super.key, required this.data, this.onTap});

  final HotelCardData data;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final successColor = context.theme.extension<AppColorsExtension>()!.success;

    return AppCard(
      onTap: onTap,
      showShadow: true,
      padding: EdgeInsets.fromLTRB(AppSpacing.sm.w, 0, AppSpacing.sm.w, AppSpacing.sm.h),
      leading: ClipRRect(
        borderRadius: AppBorders.xs,
        child: CommonImage(
          imageUrl: data.logoAsset,
          width: 30,
          height: 25,
          fit: BoxFit.cover,
        ),
      ),
      title: data.name,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          data.starRating,
          (_) => Icon(Icons.star_rounded, color: Colors.amber, size: 16.sp),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HotelGallery(data: data),
          SizedBox(height: AppSpacing.sm.h),
          Row(
            children: [
              HotelScoreBadge(score: data.score, label: data.scoreLabel),
              const Spacer(),
              Text(
                '${data.reviewCount} Review',
                style: TextStyle(fontSize: 13.sp, color: cs.onSurfaceVariant),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.sm.h),
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 16.sp, color: cs.onSurfaceVariant),
              SizedBox(width: 4.w),
              Text(
                data.location,
                style: TextStyle(fontSize: 13.sp, color: cs.onSurfaceVariant),
              ),
            ],
          ),
          for (final feature in data.features)
            Padding(
              padding: EdgeInsets.only(top: AppSpacing.xs.h),
              child: Row(
                children: [
                  Icon(Icons.check, size: 16.sp, color: successColor),
                  SizedBox(width: 4.w),
                  Text(
                    feature,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: successColor,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
