import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/cafe/domain/cafe_spec.dart';
import 'package:bookly/src/features/cafe/presentation/providers/cafe_booking_flow_provider.dart';
import 'package:bookly/src/features/venue/presentation/providers/booking_flow_state.dart';
import 'package:bookly/src/features/venue/presentation/widgets/venue_widgets.dart';

/// Success screen shown after "Confirm & pay" on the cafe booking-summary step.
///
/// The booking details are snapshotted in [initState] rather than watched, so
/// clearing [cafeBookingFlowProvider] on the way out can't blank the screen for
/// a frame. It's terminal — both CTAs leave the wizard.
class CafeBookingConfirmedScreen extends ConsumerStatefulWidget {
  const CafeBookingConfirmedScreen({super.key});

  @override
  ConsumerState<CafeBookingConfirmedScreen> createState() =>
      _CafeBookingConfirmedScreenState();
}

class _CafeBookingConfirmedScreenState
    extends ConsumerState<CafeBookingConfirmedScreen> {
  late final String _bookingId;
  late final DateTime? _date;
  late final PaymentMethod? _paymentMethod;

  @override
  void initState() {
    super.initState();
    final state = ref.read(cafeBookingFlowProvider);
    _date = state.date;
    _paymentMethod = state.paymentMethod;
    // TODO: Use the reference returned by the booking API once it exists.
    _bookingId = mockBookingId();
  }

  /// Clears the finished booking, then leaves for [route].
  void _leaveFor(String route) {
    ref.read(cafeBookingFlowProvider.notifier).reset();
    context.go(route);
  }

  @override
  Widget build(BuildContext context) {
    return BookingConfirmedBody(
      bookingId: _bookingId,
      date: _date,
      paymentMethod: _paymentMethod,
      subTotal: cafeSpec.subTotal,
      fees: cafeSpec.fees,
      total: cafeSpec.total,
      onViewBooking: () => _leaveFor(AppRoutes.myBooking),
      onBackToHome: () => _leaveFor(AppRoutes.home),
    );
  }
}
