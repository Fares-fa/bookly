import 'package:qr_flutter/qr_flutter.dart';

import 'package:bookly/src/imports/imports.dart';

/// The static check-in QR code shown on `BookingDetailsScreen`.
class QrCard extends StatelessWidget {
  const QrCard({super.key, required this.qrData});

  final String qrData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sm.w),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: AppBorders.lg,
        boxShadow: AppShadows.card,
      ),
      child: QrImageView(
        data: qrData,
        version: QrVersions.auto,
        size: 150.w,
        gapless: false,
      ),
    );
  }
}
