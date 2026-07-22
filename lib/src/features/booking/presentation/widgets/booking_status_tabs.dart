import 'package:bookly/src/imports/imports.dart';

const _statusTabs = ['All', 'Upcoming', 'Completed', 'Cancelled'];

/// "All / Upcoming / Completed / Cancelled" tab row for [MyBookingScreen].
class BookingStatusTabs extends StatefulWidget {
  const BookingStatusTabs({super.key, required this.selectedIndex, required this.onChanged});

  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  State<BookingStatusTabs> createState() => _BookingStatusTabsState();
}

class _BookingStatusTabsState extends State<BookingStatusTabs> with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: _statusTabs.length,
      initialIndex: widget.selectedIndex,
      vsync: this,
    )..addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (_controller.indexIsChanging) return;
    widget.onChanged(_controller.index);
  }

  @override
  void didUpdateWidget(covariant BookingStatusTabs oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != _controller.index) {
      _controller.index = widget.selectedIndex;
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTabChange);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    return TabBar(
      controller: _controller,
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      padding: EdgeInsets.zero,
      labelPadding: EdgeInsets.only(right: AppSpacing.lg.w),
      labelColor: cs.primary,
      unselectedLabelColor: cs.onSurfaceVariant,
      labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
      indicatorColor: cs.primary,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 2,
      dividerColor: cs.outlineVariant,
      tabs: _statusTabs.map((label) => Tab(text: label)).toList(),
    );
  }
}
