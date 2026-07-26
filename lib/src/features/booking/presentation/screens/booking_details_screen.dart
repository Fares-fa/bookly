import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/booking/presentation/widgets/booking_details_data.dart';
import 'package:bookly/src/features/booking/presentation/widgets/booking_details_header.dart';
import 'package:bookly/src/features/booking/presentation/widgets/hotel_stay_card.dart';
import 'package:bookly/src/features/booking/presentation/widgets/room_details_card.dart';
import 'package:bookly/src/features/booking/presentation/widgets/payment_summary.dart';
import 'package:bookly/src/features/booking/presentation/widgets/qr_card.dart';

export 'package:bookly/src/features/booking/presentation/widgets/booking_details_data.dart';

/// Placeholder QR payload — not tied to any booking system, just a static
/// code rendered client-side.
const _kStaticQrData = 'BOOKLY-BOOKING-CONFIRMATION';

/// Full details for a single booking: hotel summary, stay dates, room info,
/// payment breakdown, and a check-in QR code.
class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key, required this.data});

  final BookingDetailsData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FA),
      body: SafeArea(
        child: Column(
          children: [
            const BookingDetailsHeader(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(AppSpacing.md.w),
                children: [
                  HotelStayCard(data: data),
                  SizedBox(height: AppSpacing.md.h),
                  RoomDetailsCard(data: data),
                  SizedBox(height: AppSpacing.lg.h),
                  PaymentSummary(data: data),
                  SizedBox(height: AppSpacing.xl.h),
                  const Center(child: QrCard(qrData: _kStaticQrData)),
                  SizedBox(height: AppSpacing.md.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
