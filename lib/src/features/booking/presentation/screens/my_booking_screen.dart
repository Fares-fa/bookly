import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/booking/presentation/booking_category.dart';
import 'package:bookly/src/features/booking/presentation/widgets/booking_header.dart';
import 'package:bookly/src/features/booking/presentation/widgets/booking_category_selector.dart';
import 'package:bookly/src/features/booking/presentation/widgets/booking_status_tabs.dart';
import 'package:bookly/src/features/booking/presentation/widgets/booking_card.dart';

const _placeholderBookings = <BookingCardData>[
  BookingCardData(
    category: BookingCategory.hotels,
    image: AppAssets.favouritesHotel,
    title: 'Mövenpick resort sharm',
    dateRange: '16 Feb 2026 - 21 Feb 2026',
    guestsLabel: '2 Guests . 1 room',
    location: 'Namaa Bay',
    price: 'EGP 99,520',
    nightsLabel: 'For 5 Nights',
  ),
];

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({super.key});

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  BookingCategory _selectedCategory = BookingCategory.hotels;
  int _selectedStatusTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(AppSpacing.md.w, AppSpacing.md.h, AppSpacing.md.w, 0),
              child: const BookingHeader(),
            ),
            SizedBox(height: AppSpacing.md.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md.w),
              child: BookingCategorySelector(
                selected: _selectedCategory,
                onChanged: (category) => setState(() => _selectedCategory = category),
              ),
            ),
            SizedBox(height: AppSpacing.md.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md.w),
              child: BookingStatusTabs(
                selectedIndex: _selectedStatusTab,
                onChanged: (index) => setState(() => _selectedStatusTab = index),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(AppSpacing.md.w),
                itemCount: _placeholderBookings.length,
                separatorBuilder: (context, index) => SizedBox(height: AppSpacing.md.h),
                itemBuilder: (context, index) => BookingCard(data: _placeholderBookings[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
