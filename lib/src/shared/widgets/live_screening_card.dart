import 'package:bookly/generated/l10n.dart';

import '../../imports/imports.dart';

import 'package:bookly/src/features/home/domain/entities/live_screening.dart';
import 'package:bookly/src/features/home/presentation/providers/home_providers.dart';

class LiveScreeningCard extends ConsumerWidget {
  const LiveScreeningCard({super.key, required this.screening, required this.width});

  final LiveScreening screening;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tt = context.theme.textTheme;
    final cs = context.theme.colorScheme;

    final appColors = context.appColors;

    // Scoped with `.select` so toggling this heart repaints only this card.
    final isFavorite = ref.watch(favoriteIdsProvider.select((ids) => ids.contains(screening.id)));

    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: AppBorders.sm,
        color: Colors.white
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4,4,4,8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: MediaCardShell(
                imageAsset: screening.imageAsset,
                width: width,
                imageHeight: 97.h,
                isFavorite: isFavorite,
                onFavoriteToggle: () => ref.read(favoriteIdsProvider.notifier).toggle(screening.id),
                topEdgeBadge: SeatsBadge(label: S.of(context).commonExtraSeatsLeftLabel(screening.seatsLeft.toString()), color: appColors.green?? appColors.success),
                caption:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            screening.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: tt.titleSmall?.copyWith(fontWeight: FontWeight.w500,fontSize: 14, color: cs.onSurface),
                          ),
                        ),
                        Expanded(
                          child: RichText(
                            maxLines: 1,
                            text: TextSpan(
                              text: S.of(context).commonExtraEgpCurrencyPrefix,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10
                              ),
                              children: [
                                TextSpan(
                                  text: '${screening.price}  ',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.xxs),
                    Text(
                      S.of(context).commonExtraCategoryDistanceKm(
                          screening.category, screening.distanceKm.toStringAsFixed(1)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant,fontWeight: FontWeight.w400,fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              child: AppButton(
                label: S.of(context).commonExtraBookYourSeatsLabel,
                onPressed: () {},
                color: appColors.primary,
                textColor: Colors.white,
                height: ButtonSize.small,
                customHeight: 36,
                isFullWidth: true,
                labelFontWeight: FontWeight.w400,
                borderRadius: BorderRadius.circular(28),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}