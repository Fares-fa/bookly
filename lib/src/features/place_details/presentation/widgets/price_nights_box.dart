import 'package:flutter/material.dart';

import 'package:bookly/src/theme/app_colors.dart';
import 'package:bookly/src/theme/app_text_style.dart';

/// Read-only price/nights info shown in the bottom bar's secondary slot,
/// replacing a tappable action for screens where that info matters more
/// (e.g. hotel booking).
///
/// Hotel screens show plain text; restaurant screens keep the circular
/// container to match the rest of that flow's secondary slot styling.
class PriceNightsBox extends StatelessWidget {
  const PriceNightsBox({
    super.key,
    this.price,
    this.numberOfNights,
    this.isHotel = false,
  });

  final String? price;
  final int? numberOfNights;
  final bool isHotel;

  @override
  Widget build(BuildContext context) {
    final nightsLabel = numberOfNights == null
        ? null
        : '$numberOfNights ${numberOfNights == 1 ? 'night' : 'nights'}';

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          price ?? '-',
          style: AppTextStyle.primaryW500Size9
              .copyWith(fontWeight: FontWeight.w700, fontSize: 20),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (nightsLabel != null) ...[
          const SizedBox(height: 2),
          Text(
            'For $nightsLabel',
            style: AppTextStyle.grey400Size14.copyWith(fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );

    if (isHotel) return content;

    return Container(
      width: 66,
      height: 66,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.menuBg,
        shape: BoxShape.circle,
      ),
      child: content,
    );
  }
}
