import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/hotels/presentation/widgets/room_card_data.dart';
import 'package:bookly/src/features/hotels/presentation/widgets/room_gallery_viewer.dart';
import 'package:bookly/src/shared/widgets/primary_button.dart';

export 'package:bookly/src/features/hotels/presentation/widgets/room_card_data.dart';

/// A room summary card: photo, description, feature chips and price/nights,
/// used in [HotelRoomsScreen].
///
/// Tapping "Select" expands the card to reveal [RoomCardData.packages] as
/// radio options (e.g. All inclusive, Breakfast included), each with its own
/// price. Once a package is picked, [onPackageSelected] fires with the
/// chosen package and the button becomes "Deselect", which clears the
/// selection and fires [onPackageSelected] with `null`.
class RoomCard extends StatefulWidget {
  const RoomCard({super.key, required this.data, this.onPackageSelected});

  final RoomCardData data;
  final void Function(RoomPackage? package)? onPackageSelected;

  @override
  State<RoomCard> createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  bool _expanded = false;
  RoomPackage? _selected;

  void _toggleExpanded() {
    if (widget.data.packages.isEmpty) return;
    setState(() => _expanded = !_expanded);
  }

  void _selectPackage(RoomPackage package) {
    setState(() => _selected = package);
    widget.onPackageSelected?.call(package);
  }

  void _deselectPackage() {
    setState(() => _selected = null);
    widget.onPackageSelected?.call(null);
  }

  static IconData _iconFor(String feature) {
    switch (feature.toLowerCase()) {
      case 'wifi':
        return Icons.wifi;
      case 'tv':
        return Icons.tv;
      case 'air conditioning':
        return Icons.ac_unit;
      default:
        return Icons.check;
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data;
    final displayPrice = _selected?.price ?? data.price;

    return AppCard(
      showShadow: true,
      padding: EdgeInsets.all(AppSpacing.xs.w),
      child: Column(
        spacing: 10,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () =>
                    RoomGalleryViewer.show(context, images: data.images),
                child: ClipRRect(
                  borderRadius: AppBorders.md,
                  child: SizedBox(
                    width: 120,
                    height: 125,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CommonImage(
                          imageUrl: data.images.first,
                          fit: BoxFit.cover,
                        ),
                        if (data.images.length > 1)
                          Positioned(
                            right: 4,
                            bottom: 4,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.w, vertical: 2.h),
                              decoration: const BoxDecoration(
                                color: AppColors.scrimStrong,
                                borderRadius: AppBorders.sm,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.photo_library,
                                      size: 12.sp, color: AppColors.white),
                                  SizedBox(width: 2.w),
                                  Text(
                                    '${data.images.length}',
                                    style: AppTextStyle.whiteW400Size14
                                        .copyWith(fontSize: 11.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: AppSpacing.sm.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.description,
                      style: AppTextStyle.blackW500Size14,
                    ),
                    SizedBox(height: AppSpacing.xs.h),
                    Wrap(
                      spacing: AppSpacing.xs.w,
                      runSpacing: AppSpacing.xs.h,
                      children: [
                        for (final feature in data.features)
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSpacing.xs.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: AppBorders.sm,
                                border: Border.all(
                                    color: AppColors.black, width: 0.5)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(_iconFor(feature),
                                    size: 12.sp, color: AppColors.black),
                                SizedBox(width: 4.w),
                                Text(feature,
                                    style: AppTextStyle.blackW400Size12
                                        .copyWith(fontSize: 10)),
                              ],
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.xs.h),
                  ],
                ),
              ),
            ],
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: _expanded
                ? Padding(
                    padding: EdgeInsets.only(bottom: AppSpacing.xs.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (final package in data.packages)
                          _PackageOption(
                            package: package,
                            selected: _selected == package,
                            onTap: () => _selectPackage(package),
                          ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 135,
                child: PrimaryButton(
                  label: _selected != null ? 'Deselect' : 'Select',
                  suffixIcon: _selected != null
                      ? null
                      : Icon(
                          _expanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: AppColors.white,
                          size: 18.sp,
                        ),
                  onPressed:
                      _selected != null ? _deselectPackage : _toggleExpanded,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    displayPrice,
                    style: AppTextStyle.blackW500Size17.copyWith(
                        color: AppColors.primary,
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'For ${data.numberOfNights} ${data.numberOfNights == 1 ? 'night' : 'nights'}',
                    style: AppTextStyle.grey400Size14.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// A single radio-selectable package row (e.g. "All inclusive — EGP 17,200").
class _PackageOption extends StatelessWidget {
  const _PackageOption({
    required this.package,
    required this.selected,
    required this.onTap,
  });

  final RoomPackage package;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppBorders.sm,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: Row(
          children: [
            _RadioDot(selected: selected),
            SizedBox(width: AppSpacing.sm.w),
            Expanded(
              child: Text(package.name, style: AppTextStyle.blackW400Size14),
            ),
            Text(
              package.price,
              style: AppTextStyle.blackW500Size14
                  .copyWith(color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}

class _RadioDot extends StatelessWidget {
  const _RadioDot({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 20.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? AppColors.primary : AppColors.textGray,
          width: 2,
        ),
      ),
      child: selected
          ? Center(
              child: Container(
                width: 10.w,
                height: 10.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
              ),
            )
          : null,
    );
  }
}
