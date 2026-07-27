import 'package:bookly/src/imports/imports.dart';


import 'package:bookly/src/features/categories/venue/presentation/widgets/venue_widgets.dart';

import '../../../venue/presentation/providers/booking_flow_state.dart';
import '../../domain/restaurant_spec.dart';
import '../providers/booking_flow_provider.dart';

/// Success screen shown after "Confirm & pay" on the booking-summary step.
///
/// The booking details are snapshotted in [initState] rather than watched, so
/// clearing [bookingFlowProvider] on the way out can't blank the screen for a
/// frame. It's terminal — there's no back control, both CTAs leave the wizard.
class BookingConfirmedScreen extends ConsumerStatefulWidget {
  const BookingConfirmedScreen({super.key});

  @override
  ConsumerState<BookingConfirmedScreen> createState() =>
      _BookingConfirmedScreenState();
}

class _BookingConfirmedScreenState
    extends ConsumerState<BookingConfirmedScreen> {
  late final String _bookingId;
  late final DateTime? _date;
  late final PaymentMethod? _paymentMethod;

  @override
  void initState() {
    super.initState();
    final state = ref.read(bookingFlowProvider);
    _date = state.date;
    _paymentMethod = state.paymentMethod;
    // TODO: Use the reference returned by the booking API once it exists.
    _bookingId = mockBookingId();
  }

  /// Clears the finished booking, then leaves for [route].
  void _leaveFor(String route) {
    ref.read(bookingFlowProvider.notifier).reset();
    context.go(route,extra: {
      'isReservation': true,
    },);
  }

  @override
  Widget build(BuildContext context) {
    return BookingConfirmedBody(
      bookingId: _bookingId,
      date: _date,
      paymentMethod: _paymentMethod,
      subTotal: restaurantSpec.subTotal,
      fees: restaurantSpec.fees,
      total: restaurantSpec.total,
      onViewBooking: () => _leaveFor(AppRoutes.myBooking,),
      onBackToHome: () => _leaveFor(AppRoutes.home),
    );
  }
}
