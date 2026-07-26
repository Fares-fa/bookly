import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/venue/presentation/providers/booking_flow_state.dart';

/// Result returned by [ReservationCalendarSheet] when the user taps "Next".
typedef ReservationSelection = ({DateTime date, TimeOfDay time});

/// Modal calendar + time picker shown over the Book-Table step (mockup 2).
///
/// Opens on the month of [initialDate], lets the user pick a day and a time,
/// and pops with a [ReservationSelection] when "Next" is tapped.
class ReservationCalendarSheet extends StatefulWidget {
  const ReservationCalendarSheet({
    super.key,
    this.initialDate,
    this.initialTime,
  });

  final DateTime? initialDate;
  final TimeOfDay? initialTime;

  @override
  State<ReservationCalendarSheet> createState() =>
      _ReservationCalendarSheetState();

  /// Shows the sheet as a modal bottom sheet and returns the picked selection.
  static Future<ReservationSelection?> show(
    BuildContext context, {
    DateTime? initialDate,
    TimeOfDay? initialTime,
  }) {
    return showModalBottomSheet<ReservationSelection>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ReservationCalendarSheet(
        initialDate: initialDate,
        initialTime: initialTime,
      ),
    );
  }
}

class _ReservationCalendarSheetState extends State<ReservationCalendarSheet> {
  List<String> _weekdayLabels(BuildContext context) {
    final s = S.of(context);
    return [
      s.venueCalendarSun,
      s.venueCalendarMon,
      s.venueCalendarTue,
      s.venueCalendarWed,
      s.venueCalendarThu,
      s.venueCalendarFri,
      s.venueCalendarSat,
    ];
  }

  late DateTime _month; // first day of the displayed month
  late DateTime _selected; // the chosen day (date only)
  late int _hour; // 1..12
  late int _minute;
  late bool _isAm;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    final initialDate = widget.initialDate ?? now;
    _selected = DateTime(initialDate.year, initialDate.month, initialDate.day);
    _month = DateTime(initialDate.year, initialDate.month);

    final t = widget.initialTime ?? TimeOfDay.fromDateTime(now);
    _hour = t.hourOfPeriod == 0 ? 12 : t.hourOfPeriod;
    _minute = t.minute;
    _isAm = t.period == DayPeriod.am;
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  void _shiftMonth(int delta) => setState(() {
        _month = DateTime(_month.year, _month.month + delta);
      });

  void _selectDay(DateTime day) => setState(() {
        _selected = DateTime(day.year, day.month, day.day);
        if (day.month != _month.month || day.year != _month.year) {
          _month = DateTime(day.year, day.month);
        }
      });

  Future<void> _editTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: _isAm ? _hour % 12 : (_hour % 12) + 12,
        minute: _minute,
      ),
    );
    if (picked != null) {
      setState(() {
        _hour = picked.hourOfPeriod == 0 ? 12 : picked.hourOfPeriod;
        _minute = picked.minute;
        _isAm = picked.period == DayPeriod.am;
      });
    }
  }

  void _submit() {
    final time = TimeOfDay(
      hour: _isAm ? _hour % 12 : (_hour % 12) + 12,
      minute: _minute,
    );
    Navigator.of(context).pop<ReservationSelection>((
      date: _selected,
      time: time,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorders.bottomSheet,
      ),
      padding: EdgeInsets.fromLTRB(
        AppSpacing.ml,
        AppSpacing.ml,
        AppSpacing.ml,
        AppSpacing.ml + MediaQuery.of(context).padding.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _header(),
          SizedBox(height: AppSpacing.md),
          _weekdayRow(context),
          SizedBox(height: AppSpacing.sm),
          _daysGrid(),
          SizedBox(height: AppSpacing.ml),
          _timeRow(context),
          SizedBox(height: AppSpacing.ml),
          AppButton(
            label: S.of(context).venueNextButton,
            isFullWidth: true,
            customHeight: 56.h,
            labelFontWeight: FontWeight.w600,
            borderRadius: AppBorders.full,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [
        Text(
          formatCalendarMonth(_month),
          style: AppTextStyle.blackW500Size18.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: AppSpacing.sm),
        const Icon(Icons.chevron_right, color: AppColors.primary, size: 22),
        const Spacer(),
        _chevron(Icons.chevron_left, () => _shiftMonth(-1)),
        SizedBox(width: AppSpacing.sm),
        _chevron(Icons.chevron_right, () => _shiftMonth(1)),
      ],
    );
  }

  Widget _chevron(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.w,
        height: 32.w,
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: AppBorders.sm,
        ),
        child: Icon(icon, size: 20, color: AppColors.textDark),
      ),
    );
  }

  Widget _weekdayRow(BuildContext context) {
    return Row(
      children: [
        for (final label in _weekdayLabels(context))
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
    // Sunday-first grid: weekday%7 gives Sun=0 … Sat=6.
    final leading = firstOfMonth.weekday % 7;
    final gridStart = firstOfMonth.subtract(Duration(days: leading));
    final today = DateTime.now();

    return Column(
      children: [
        for (var week = 0; week < 6; week++)
          Padding(
            padding: EdgeInsets.only(bottom: AppSpacing.xs),
            child: Row(
              children: [
                for (var d = 0; d < 7; d++)
                  Expanded(
                    child: _dayCell(
                      gridStart.add(Duration(days: week * 7 + d)),
                      today,
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _dayCell(DateTime day, DateTime today) {
    final inMonth = day.month == _month.month;
    final isSelected = _isSameDay(day, _selected);
    final isToday = _isSameDay(day, today);

    final Color bg;
    final Color fg;
    if (isSelected) {
      bg = AppColors.primary;
      fg = AppColors.white;
    } else if (isToday) {
      bg = AppColors.divider;
      fg = AppColors.textDark;
    } else {
      bg = Colors.transparent;
      fg = inMonth
          ? AppColors.textDark
          : AppColors.textGray.withValues(alpha: 0.5);
    }

    return GestureDetector(
      onTap: () => _selectDay(day),
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: Container(
          width: 38.w,
          height: 38.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
          child: Text(
            '${day.day}',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: fg,
            ),
          ),
        ),
      ),
    );
  }

  Widget _timeRow(BuildContext context) {
    return Row(
      children: [
        Text(
          S.of(context).venueTimeLabel,
          style: AppTextStyle.blackW500Size17.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: _editTime,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            decoration: const BoxDecoration(
              color: AppColors.background,
              borderRadius: AppBorders.sm,
            ),
            child: Text(
              '${_hour.toString().padLeft(2, '0')} : ${_minute.toString().padLeft(2, '0')}',
              style: AppTextStyle.blackW500Size17,
            ),
          ),
        ),
        SizedBox(width: AppSpacing.sm),
        _meridiemToggle(context),
      ],
    );
  }

  Widget _meridiemToggle(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: AppBorders.sm,
      ),
      child: Row(
        children: [
          _meridiemSegment(
            isAm: true,
            label: S.of(context).venueAmLabel,
            selected: _isAm,
          ),
          _meridiemSegment(
            isAm: false,
            label: S.of(context).venuePmLabel,
            selected: !_isAm,
          ),
        ],
      ),
    );
  }

  Widget _meridiemSegment({
    required bool isAm,
    required String label,
    required bool selected,
  }) {
    return GestureDetector(
      onTap: () => setState(() => _isAm = isAm),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: selected ? AppColors.white : Colors.transparent,
          borderRadius: AppBorders.sm,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: selected ? AppColors.textDark : AppColors.textGray,
          ),
        ),
      ),
    );
  }
}
