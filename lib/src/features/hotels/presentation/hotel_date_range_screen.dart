import 'package:bookly/src/imports/imports.dart';
import 'package:bookly/src/shared/widgets/primary_button.dart';

/// Full-screen check-in/check-out date range picker, reached from
/// [HotelSearchForm], wrapped in [BodyApp] like the rest of the app.
class HotelDateRangeScreen extends StatefulWidget {
  const HotelDateRangeScreen({
    super.key,
    this.initialCheckIn,
    this.initialCheckOut,
  });

  final DateTime? initialCheckIn;
  final DateTime? initialCheckOut;

  @override
  State<HotelDateRangeScreen> createState() => _HotelDateRangeScreenState();
}

class _HotelDateRangeScreenState extends State<HotelDateRangeScreen> {
  static const _weekdayLabels = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  static const _monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  late DateTime _month;
  late DateTime _today; // date-only, for disabling past days
  DateTime? _checkIn;
  DateTime? _checkOut;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _today = DateTime(now.year, now.month, now.day);
    _checkIn = widget.initialCheckIn;
    _checkOut = widget.initialCheckOut;
    final base = widget.initialCheckIn ?? now;
    _month = DateTime(base.year, base.month);
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  bool _isInRange(DateTime day) {
    if (_checkIn == null || _checkOut == null) return false;
    return day.isAfter(_checkIn!) && day.isBefore(_checkOut!);
  }

  void _shiftMonth(int delta) => setState(() {
        _month = DateTime(_month.year, _month.month + delta);
      });

  void _selectDay(DateTime day) {
    setState(() {
      if (_checkIn == null || _checkOut != null) {
        _checkIn = day;
        _checkOut = null;
      } else if (day.isBefore(_checkIn!)) {
        _checkIn = day;
      } else if (_isSameDay(day, _checkIn!)) {
        _checkOut = day.add(const Duration(days: 1));
      } else {
        _checkOut = day;
      }
    });
  }

  void _confirm() {
    if (_checkIn == null) return;
    context.pop(
      DateTimeRange(
        start: _checkIn!,
        end: _checkOut ?? _checkIn!.add(const Duration(days: 1)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BodyApp(
      txtCustomAppBar: 'Select Dates',
      onPressedArrowBack: () => context.pop(),
      bodyOfContent: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.md.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            SizedBox(height: AppSpacing.md.h),
            _weekdayRow(),
            SizedBox(height: AppSpacing.sm.h),
            _daysGrid(),
            SizedBox(height: AppSpacing.ml.h),
            PrimaryButton(
              label: 'Confirm',
              isFullWidth: true,
              onPressed: _checkIn != null ? _confirm : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    final canGoToPreviousMonth = _month.isAfter(DateTime(_today.year, _today.month));

    return Row(
      children: [
        Text(
          '${_monthNames[_month.month - 1]} ${_month.year}',
          style: AppTextStyle.blackW500Size18.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        _chevron(Icons.chevron_left, canGoToPreviousMonth ? () => _shiftMonth(-1) : null),
        SizedBox(width: AppSpacing.sm.w),
        _chevron(Icons.chevron_right, () => _shiftMonth(1)),
      ],
    );
  }

  Widget _chevron(IconData icon, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.w,
        height: 32.w,
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: AppBorders.sm,
        ),
        child: Icon(
          icon,
          size: 20,
          color: onTap != null ? AppColors.textDark : AppColors.textGray.withValues(alpha: 0.4),
        ),
      ),
    );
  }

  Widget _weekdayRow() {
    return Row(
      children: [
        for (final label in _weekdayLabels)
          Expanded(
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textGray,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _daysGrid() {
    final firstOfMonth = DateTime(_month.year, _month.month);
    final leading = firstOfMonth.weekday % 7;
    final gridStart = firstOfMonth.subtract(Duration(days: leading));

    return Column(
      children: [
        for (var week = 0; week < 6; week++)
          Padding(
            padding: EdgeInsets.only(bottom: AppSpacing.xs.h),
            child: Row(
              children: [
                for (var d = 0; d < 7; d++)
                  Expanded(
                    child: _dayCell(gridStart.add(Duration(days: week * 7 + d))),
                  ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _dayCell(DateTime day) {
    final inMonth = day.month == _month.month;
    final isCheckIn = _checkIn != null && _isSameDay(day, _checkIn!);
    final isCheckOut = _checkOut != null && _isSameDay(day, _checkOut!);
    final isEndpoint = isCheckIn || isCheckOut;
    final inRange = _isInRange(day);
    final isPast = day.isBefore(_today);

    final Color bg;
    final Color fg;
    if (isEndpoint) {
      bg = AppColors.primary;
      fg = AppColors.white;
    } else if (inRange) {
      bg = AppColors.primary.withValues(alpha: 0.15);
      fg = AppColors.textDark;
    } else {
      bg = Colors.transparent;
      fg = isPast
          ? AppColors.textGray.withValues(alpha: 0.3)
          : inMonth
              ? AppColors.textDark
              : AppColors.textGray.withValues(alpha: 0.5);
    }

    return GestureDetector(
      onTap: isPast ? null : () => _selectDay(day),
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: Container(
          width: 38.w,
          height: 38.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: bg,
            shape: isEndpoint ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: isEndpoint ? null : AppBorders.sm,
          ),
          child: Text(
            '${day.day}',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: isEndpoint ? FontWeight.w600 : FontWeight.w400,
              color: fg,
            ),
          ),
        ),
      ),
    );
  }
}
