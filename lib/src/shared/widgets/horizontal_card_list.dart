import '../../imports/imports.dart';

/// Fixed-extent horizontal list used by card sections such as Nearby Places
/// and Live Screenings.
///
/// Passing an explicit [itemExtent] lets [ListView.builder] skip per-item
/// layout measurement (its fixed-extent fast path), which keeps horizontal
/// scrolling smooth even as more cards are added.
class HorizontalCardList extends StatelessWidget {
  const HorizontalCardList({
    super.key,
    required this.height,
    required this.itemCount,
    required this.itemExtent,
    required this.itemBuilder,
    this.padding,
  });

  final double height;
  final int itemCount;
  final double itemExtent;
  final IndexedWidgetBuilder itemBuilder;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: padding ?? EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
        itemCount: itemCount,
        itemExtent: itemExtent,
        itemBuilder: itemBuilder,
      ),
    );
  }
}