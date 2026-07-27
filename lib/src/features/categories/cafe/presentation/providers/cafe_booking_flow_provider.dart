import 'package:bookly/src/features/categories/venue/presentation/providers/booking_flow_state.dart';

/// The cafe's own booking wizard state, so an in-progress cafe booking and an
/// in-progress restaurant booking don't overwrite each other.
final BookingFlowProvider cafeBookingFlowProvider = BookingFlowProvider(
  BookingFlowNotifier.new,
);
