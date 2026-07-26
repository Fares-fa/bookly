import 'package:bookly/src/features/venue/presentation/providers/booking_flow_state.dart';

/// The restaurant's own booking wizard state, so an in-progress restaurant
/// booking and an in-progress cafe booking don't overwrite each other.
final BookingFlowProvider bookingFlowProvider = BookingFlowProvider(
  BookingFlowNotifier.new,
);
