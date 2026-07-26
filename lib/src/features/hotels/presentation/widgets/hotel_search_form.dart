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
  DateTime? _checkIn;
  DateTime? _checkOut;
  int _adults = 1;
  int _children = 0;
  int _rooms = 1;

  Future<void> _pickDateRange() async {
    final now = DateTime.now();
    final firstDate = now;
    final lastDate = now.add(const Duration(days: 365 * 2));
    final initialRange = _checkIn != null
        ? DateTimeRange(
            start: _checkIn!,
            end: (_checkOut != null && _checkOut!.isAfter(_checkIn!))
                ? _checkOut!
                : _checkIn!.add(const Duration(days: 1)),
          )
        : null;
    final picked = await showDateRangePicker(
      context: context,
      initialDateRange: initialRange,
      firstDate: firstDate,
      lastDate: lastDate,
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
    final tt = context.textTheme;
    return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(18)),
        child: Column(
          spacing: 12,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => context.push(AppRoutes.hotelSearch),
              child: AbsorbPointer(
                child: AppTextField(
                  fillColor: const Color(0xFFF9F9F9),
                  hint: 'Enter Your Destination',
                  hintStyle: tt.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF666666)),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(12),
                    child: VectorGraphic(
                      loader: AssetBytesLoader(AppAssets.search),
                    ),
                  ),
                ),
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
              icon: Icon(Icons.bed_rounded),
              label: 'Rooms',
              value: _rooms,
              minValue: 1,
              onChanged: (value) => setState(() => _rooms = value),
            ),
            PrimaryButton(
              label: 'Search',
              isFullWidth: true,
              onPressed: () {},
            ),
          ],
        ));
  }
}
