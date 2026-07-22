import 'package:bookly/src/imports/imports.dart';

/// Placeholder tab root — booking history/management isn't built yet.
class MyBookingPage extends StatelessWidget {
  const MyBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Booking'), automaticallyImplyLeading: false),
      body: const AppEmptyState(
        icon: Icons.receipt_long_outlined,
        title: 'No bookings yet',
        subtitle: 'Your upcoming and past bookings will show up here.',
      ),
    );
  }
}