import 'package:bookly/src/features/hotels/presentation/widgets/hotel_header.dart';
import 'package:bookly/src/features/hotels/presentation/widgets/hotel_search_form.dart';
import 'package:bookly/src/features/hotels/presentation/widgets/popular_destinations.dart';
import 'package:bookly/src/imports/imports.dart';

import '../../../../generated/l10n.dart';
import '../../categories/venue/presentation/widgets/booking_header.dart';

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
               SliverToBoxAdapter(child:  VenueBookingHeader(
                title: 'Booking Hotels',
              ),),
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
