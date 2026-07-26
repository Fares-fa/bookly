import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/features/booking/presentation/widgets/booking_details_data.dart';
import 'package:bookly/src/features/booking/presentation/widgets/stay_column.dart';

/// The hotel photo + check-in/check-out summary card on `BookingDetailsScreen`.
class HotelStayCard extends StatelessWidget {
  const HotelStayCard({super.key, required this.data});

  final BookingDetailsData data;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final sectionHeight = 100.h;

    return Container(
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: AppBorders.card,
        boxShadow: AppShadows.card,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(AppSpacing.xs.w),
            height: sectionHeight,
            child: ClipRRect(
              borderRadius: AppBorders.md,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CommonImage(imageUrl: data.heroImage, fit: BoxFit.cover),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: AppSpacing.sm.h,
                    left: AppSpacing.xs.w,
                    right: AppSpacing.xs.w,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: AppBorders.xs,
                          child: CommonImage(imageUrl: data.hotelLogo, width: 28, height: 24, fit: BoxFit.cover),
                        ),
                        SizedBox(width: AppSpacing.xs.w),
                        Expanded(
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  data.hotelName,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 12.5.sp, fontWeight: FontWeight.w700, color: Colors.white),
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Icon(Icons.chevron_right, color: Colors.white, size: 13.sp),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            data.starRating,
                            (_) => Icon(Icons.star_rounded, color: Colors.amber, size: 12.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: AppSpacing.sm.h,
                    left: AppSpacing.sm.w,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star_rounded, size: 18.sp, color: Colors.amber),
                        SizedBox(width: 6.w),
                        Text(
                          data.reviewScore.toStringAsFixed(1),
                          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(AppSpacing.md.w, AppSpacing.sm.h, AppSpacing.md.w, AppSpacing.md.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: StayColumn(
                    label: S.of(context).bookingCheckInLabel,
                    primary: data.checkInDate,
                    secondary: data.checkInTime,
                  ),
                ),
                Expanded(
                  child: StayColumn(
                    label: S.of(context).bookingCheckOutLabel,
                    primary: data.checkOutDate,
                    secondary: data.checkOutTime,
                  ),
                ),
                Container(width: 1, height: 36.h, color: cs.outlineVariant),
                SizedBox(width: AppSpacing.sm.w),
                StayColumn(
                  label: S.of(context).bookingTotalStayLabel,
                  primary: data.totalStayLabel,
                  crossAxisAlignment: CrossAxisAlignment.end,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
