import 'package:bookly/src/features/hotels/presentation/widgets/destination.dart';
import 'package:bookly/src/imports/imports.dart';

class DestinationListTile extends StatelessWidget {
  const DestinationListTile({super.key, required this.destination});

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    final tt = context.textTheme;
    final cs = context.theme.colorScheme;

    return InkWell(
      onTap: () => context.push(AppRoutes.hotelResults, extra: destination.city),
      child: Row(
        children: [
          VectorGraphic(
            loader: const AssetBytesLoader(AppAssets.location),
            width: 20.w,
            height: 20.w,
          ),
          SizedBox(width: AppSpacing.sm.w),
          Expanded(
            child: Text(
              destination.city,
              style: tt.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            '${destination.numberOfHotels} Hotels',
            style: tt.bodySmall?.copyWith(color: cs.onSurface.withValues(alpha: 0.6)),
          ),
        ],
      ),
    );
  }
}
