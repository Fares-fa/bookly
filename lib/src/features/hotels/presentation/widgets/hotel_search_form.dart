import 'package:bookly/src/features/categories/venue/presentation/widgets/search_bar.dart'
    show SearchBarBooking;
import 'package:bookly/src/features/hotels/presentation/widgets/counter_field.dart';
import 'package:bookly/src/features/hotels/presentation/widgets/date_field.dart';
import 'package:bookly/src/imports/imports.dart';
import 'package:bookly/src/shared/widgets/primary_button.dart';

class HotelSearchForm extends StatefulWidget {
  const HotelSearchForm({super.key});

  @override
  State<HotelSearchForm> createState() => _HotelSearchFormState();
}

class _HotelSearchFormState extends State<HotelSearchForm> {
  final _destinationController = TextEditingController();
  DateTime? _checkIn;
  DateTime? _checkOut;
  int _adults = 1;
  int _children = 0;
  int _rooms = 1;

  @override
  void dispose() {
    _destinationController.dispose();
    super.dispose();
  }

  Future<void> _pickDestination() async {
    final city = await context.push<String>(AppRoutes.hotelSearch);
    if (city == null) return;
    setState(() => _destinationController.text = city);
  }

  Future<void> _pickDateRange() async {
    final picked = await context.push<DateTimeRange>(
      AppRoutes.hotelDateRange,
      extra: {'checkIn': _checkIn, 'checkOut': _checkOut},
    );
    if (picked == null) return;
    setState(() {
      _checkIn = picked.start;
      _checkOut = picked.end;
    });
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(18)),
        child: Column(
          spacing: 12,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _pickDestination,
              child: AbsorbPointer(
                child: const SearchBarBooking(),
              ),
            ),
            Row(
              spacing: 12,
              children: [
                Expanded(
                  child: DateField(
                    label: 'Check in',
                    date: _checkIn,
                    formatDate: _formatDate,
                    onTap: _pickDateRange,
                  ),
                ),
                Expanded(
                  child: DateField(
                    label: 'Check out',
                    date: _checkOut,
                    formatDate: _formatDate,
                    onTap: _pickDateRange,
                  ),
                ),
              ],
            ),
            Row(
              spacing: 12,
              children: [
                Expanded(
                  child: CounterField(
                    label: 'Adults',
                    value: _adults,
                    minValue: 1,
                    onChanged: (value) => setState(() => _adults = value),
                  ),
                ),
                Expanded(
                  child: CounterField(
                    label: 'Children',
                    value: _children,
                    minValue: 0,
                    onChanged: (value) => setState(() => _children = value),
                  ),
                ),
              ],
            ),
            CounterField(
              icon: const Icon(Icons.bed_rounded),
              label: 'Rooms',
              value: _rooms,
              minValue: 1,
              onChanged: (value) => setState(() => _rooms = value),
            ),
            PrimaryButton(
              label: 'Search',
              isFullWidth: true,
              onPressed: () {
                if (_destinationController.text.isEmpty) return;
                context.push(
                  AppRoutes.hotelResults,
                  extra: _destinationController.text,
                );
              },
            ),
          ],
        ));
  }
}
