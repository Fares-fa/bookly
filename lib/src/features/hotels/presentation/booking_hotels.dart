import 'package:bookly/src/features/home/presentation/widgets/home_header.dart';
import 'package:bookly/src/features/hotels/presentation/widgets/hotel_header.dart';
import 'package:bookly/src/imports/imports.dart';
import 'package:bookly/src/shared/widgets/primary_button.dart';

class BookingHotels extends StatelessWidget {
  const BookingHotels({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F8FF),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              fit: BoxFit.fill,
              AppAssets.bookHotelBackground,
            ),
          ),
          CustomScrollView(
            physics: NeverScrollableScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(child: HotelHeader()),
              SliverToBoxAdapter(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F8FF),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(28.r)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      spacing: 12,
                      children: [
                        const HotelSearchForm(),
                        const PopularDestinations(),
                        SizedBox(height: AppSpacing.xl),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PopularDestinations extends StatelessWidget {
  const PopularDestinations();

  static const _destinations = [
    _Destination(city: 'Cairo', numberOfHotels: '1,050'),
    _Destination(city: 'Mansoura', numberOfHotels: '500'),
    _Destination(city: 'Sharm', numberOfHotels: '200'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 170,
        width: double.infinity,
        child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Popular Destinations',
                  style: context.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500)),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _destinations.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final destination = _destinations[index];
                    return _DestinationCard(destination: destination);
                  },
                ),
              ),
            ]));
  }
}

class _Destination {
  const _Destination({required this.city, required this.numberOfHotels});

  final String city;
  final String numberOfHotels;
}

class _DestinationCard extends StatelessWidget {
  const _DestinationCard({required this.destination});

  final _Destination destination;

  @override
  Widget build(BuildContext context) {
    final tt = context.textTheme;
    return Container(
      height: 110,
      width: 155,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(AppAssets.bookHotelBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0),
                  Colors.black.withValues(alpha: 0.55),
                ],
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  destination.city,
                  style: tt.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${destination.numberOfHotels} Hotels',
                  style: tt.bodySmall?.copyWith(
                    color: Colors.white.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HotelSearchForm extends StatefulWidget {
  const HotelSearchForm();

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
            AppTextField(
              fillColor: const Color(0xFFF9F9F9),
              hint: 'Enter Your Destination',
              hintStyle: tt.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400, color: const Color(0xFF666666)),
              prefixIcon: const Padding(
                padding: EdgeInsets.all(12),
                child: VectorGraphic(
                  loader: AssetBytesLoader(AppAssets.search),
                ),
              ),
            ),
            Row(
              spacing: 12,
              children: [
                Expanded(
                  child: _DateField(
                    label: 'Check in',
                    date: _checkIn,
                    formatDate: _formatDate,
                    onTap: _pickDateRange,
                  ),
                ),
                Expanded(
                  child: _DateField(
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
                  child: _CounterField(
                    label: 'Adults',
                    value: _adults,
                    minValue: 1,
                    onChanged: (value) => setState(() => _adults = value),
                  ),
                ),
                Expanded(
                  child: _CounterField(
                    label: 'Children',
                    value: _children,
                    minValue: 0,
                    onChanged: (value) => setState(() => _children = value),
                  ),
                ),
              ],
            ),
            _CounterField(
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

class _DateField extends StatelessWidget {
  const _DateField({
    required this.label,
    required this.date,
    required this.formatDate,
    required this.onTap,
  });

  final String label;
  final DateTime? date;
  final String Function(DateTime) formatDate;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tt = context.textTheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    style:
                        tt.bodySmall?.copyWith(color: const Color(0xFF666666)),
                  ),
                  Text(
                    date != null ? formatDate(date!) : 'Select date',
                    style: tt.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: date != null
                          ? const Color(0xFF1A1A1A)
                          : const Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.calendar_today_outlined,
                size: 18, color: Color(0xFF666666)),
          ],
        ),
      ),
    );
  }
}

class _CounterField extends StatelessWidget {
  const _CounterField({
    required this.label,
    required this.value,
    required this.onChanged,
    this.minValue = 0,
    this.maxValue = 20,
    this.icon,
  });

  final Widget? icon;
  final String label;
  final int value;
  final int minValue;
  final int maxValue;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final tt = context.textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              spacing: 6,
              children: [
                if (icon != null) icon!,
                Text(
                  label,
                  style: tt.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
              ],
            ),
          ),
          _CounterButton(
            icon: Icons.remove,
            onTap: value > minValue ? () => onChanged(value - 1) : null,
          ),
          SizedBox(
            width: 28,
            child: Text(
              '$value',
              textAlign: TextAlign.center,
              style: tt.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1A1A1A),
              ),
            ),
          ),
          _CounterButton(
            icon: Icons.add,
            onTap: value < maxValue ? () => onChanged(value + 1) : null,
          ),
        ],
      ),
    );
  }
}

class _CounterButton extends StatelessWidget {
  const _CounterButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 26,
        height: 26,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: enabled ? const Color(0xFF0042D3) : const Color(0xFFDDDDDD),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 16, color: Colors.white),
      ),
    );
  }
}
