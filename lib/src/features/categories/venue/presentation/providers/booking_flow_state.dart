import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/categories/venue/domain/venue_spec.dart';

/// Payment method chosen on the booking-summary step.
enum PaymentMethod {
  applePay('Apple pay'),
  newCard('New card');

  const PaymentMethod(this.label);

  /// Human-readable label used on the confirmation screen.
  final String label;
}

/// State shared across the 3-step booking wizard
/// (Book Table → Party Details → Booking Summary).
class BookingFlowState {
  const BookingFlowState({
    this.date,
    this.time,
    this.partySize = 0,
    this.option,
    this.note = '',
    this.paymentMethod,
  });

  final DateTime? date;
  final TimeOfDay? time;
  final int partySize;
  final SeatingOption? option;
  final String note;
  final PaymentMethod? paymentMethod;

  /// Step 1 is complete once both a date and a time are chosen.
  bool get hasSchedule => date != null && time != null;

  /// Step 2 is complete once at least one guest and a seating option are set.
  bool get hasPartyDetails => partySize > 0 && option != null;

  BookingFlowState copyWith({
    DateTime? date,
    TimeOfDay? time,
    int? partySize,
    SeatingOption? option,
    String? note,
    PaymentMethod? paymentMethod,
  }) {
    return BookingFlowState(
      date: date ?? this.date,
      time: time ?? this.time,
      partySize: partySize ?? this.partySize,
      option: option ?? this.option,
      note: note ?? this.note,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }
}

class BookingFlowNotifier extends Notifier<BookingFlowState> {
  @override
  BookingFlowState build() => const BookingFlowState();

  void setSchedule(DateTime date, TimeOfDay time) =>
      state = state.copyWith(date: date, time: time);

  void setPartySize(int size) =>
      state = state.copyWith(partySize: size.clamp(0, 99));

  void increment() => setPartySize(state.partySize + 1);
  void decrement() => setPartySize(state.partySize - 1);

  void selectOption(SeatingOption option) =>
      state = state.copyWith(option: option);

  void setNote(String note) => state = state.copyWith(note: note);

  void selectPayment(PaymentMethod method) =>
      state = state.copyWith(paymentMethod: method);

  /// Clears the flow once a booking is confirmed (or abandoned).
  void reset() => state = const BookingFlowState();
}

/// The provider type the shared venue widgets accept.
///
/// Each venue feature declares its own instance (see `bookingFlowProvider` /
/// `cafeBookingFlowProvider`) so an in-progress restaurant booking and an
/// in-progress cafe booking don't overwrite each other.
typedef BookingFlowProvider
    = NotifierProvider<BookingFlowNotifier, BookingFlowState>;

// ── Formatting helpers ──────────────────────────────────────────────────────

const _weekdayAbbr = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
const _monthAbbr = [
  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
];
const _monthFull = [
  'January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December',
];

/// e.g. "Mon, 28 Sep".
String formatBookingDate(DateTime date) =>
    '${_weekdayAbbr[date.weekday - 1]}, ${date.day} ${_monthAbbr[date.month - 1]}';

/// e.g. "09:00 PM".
String formatBookingTime(TimeOfDay time) {
  final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
  final minute = time.minute.toString().padLeft(2, '0');
  final period = time.period == DayPeriod.am ? 'AM' : 'PM';
  return '${hour.toString().padLeft(2, '0')}:$minute $period';
}

/// Month abbreviation + year, e.g. "Feb 2023" (used by the calendar header).
String formatCalendarMonth(DateTime month) =>
    '${_monthAbbr[month.month - 1]} ${month.year}';

/// e.g. "25 June 2026" (used on the confirmation screen).
String formatBookingFullDate(DateTime date) =>
    '${date.day} ${_monthFull[date.month - 1]} ${date.year}';
