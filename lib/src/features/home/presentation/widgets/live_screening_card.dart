import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/home/domain/entities/live_screening.dart';
import 'package:bookly/src/features/home/presentation/providers/home_providers.dart';
import 'package:bookly/src/features/home/presentation/widgets/media_card_shell.dart';

class LiveScreeningCard extends ConsumerWidget {
  const LiveScreeningCard({super.key, required this.screening, required this.width});

  final LiveScreening screening;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tt = context.theme.textTheme;
    final appColors = context.appColors;

    // Scoped with `.select` so toggling this heart repaints only this card.
    final isFavorite = ref.watch(favoriteIdsProvider.select((ids) => ids.contains(screening.id)));

    return MediaCardShell(
      imageAsset: screening.imageAsset,
      width: width,
      imageHeight: 100.h,
      isFavorite: isFavorite,
      onFavoriteToggle: () => ref.read(favoriteIdsProvider.notifier).toggle(screening.id),
      topLeftBadge: StatusBadge(label: '${screening.seatsLeft} Seats left', color: appColors.success),
      caption: Text(
        screening.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: tt.titleSmall?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}