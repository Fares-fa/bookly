import 'package:bookly/src/imports/imports.dart';

/// Horizontal strip of menu filters on the venue listing screens: a filter
/// button followed by selectable pills (e.g. All / Burger / Pizaa for a
/// restaurant, All / Coffee / Dessert for a cafe).
class VenueFilterRow extends StatefulWidget {
  const VenueFilterRow({super.key, required this.filters});

  final List<String> filters;

  @override
  State<VenueFilterRow> createState() => _VenueFilterRowState();
}

class _VenueFilterRowState extends State<VenueFilterRow> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
        children: [
          _FilterIconButton(
            onTap: () => context.showSnackBar('Filters coming soon'),
          ),
          SizedBox(width: AppSpacing.sm),
          for (var i = 0; i < widget.filters.length; i++) ...[
            _FilterPill(
              label: widget.filters[i],
              selected: i == _selected,
              onTap: () => setState(() => _selected = i),
            ),
            SizedBox(width: AppSpacing.sm),
          ],
        ],
      ),
    );
  }
}

class _FilterIconButton extends StatelessWidget {
  const _FilterIconButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42.w,
        height: 42.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: AppBorders.card,
        ),
        child: const Center(
          child: VectorGraphic(
            loader: AssetBytesLoader(AppAssets.filter),
            width: 18,
            height: 18,
          ),
        ),
      ),
    );
  }
}

class _FilterPill extends StatelessWidget {
  const _FilterPill({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.ml),
        decoration: BoxDecoration(
          color: selected ? cs.primary.withValues(alpha: 0.2) : Colors.white,
          borderRadius: AppBorders.card,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: selected ? cs.primary : AppColors.textDark,
          ),
        ),
      ),
    );
  }
}
