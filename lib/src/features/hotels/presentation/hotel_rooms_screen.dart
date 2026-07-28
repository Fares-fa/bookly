import 'package:bookly/src/features/booking/presentation/screens/booking_details_screen.dart';
import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/src/features/hotels/presentation/widgets/room_card.dart';
import 'package:bookly/src/features/place_details/presentation/widgets/bottom_bar.dart';
import 'package:bookly/src/features/place_details/presentation/widgets/price_nights_box.dart';
import 'package:bookly/src/features/place_details/presentation/widgets/step_indicator.dart';

/// Lists the rooms available for a hotel, shown after choosing "Choose Room"
/// on [HotelDetailsScreen]. This is step 2 of the hotel booking flow.
class HotelRoomsScreen extends StatefulWidget {
  const HotelRoomsScreen({
    super.key,
    required this.hotelName,
    this.rooms = placeholderRooms,
    this.onContinue,
  });

  final String hotelName;
  final List<RoomCardData> rooms;
  final void Function(RoomCardData room, RoomPackage package)? onContinue;

  @override
  State<HotelRoomsScreen> createState() => _HotelRoomsScreenState();
}

class _HotelRoomsScreenState extends State<HotelRoomsScreen> {
  RoomCardData? _selectedRoom;
  RoomPackage? _selectedPackage;

  void _onPackageSelected(RoomCardData room, RoomPackage? package) {
    setState(() {
      _selectedRoom = package == null ? null : room;
      _selectedPackage = package;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BodyApp(
      txtCustomAppBar: widget.hotelName,
      onPressedArrowBack: () => GoRouter.of(context).pop(),
      bodyOfContent: SafeArea(
        child: Column(
          children: [
            // SimpleHeader(title: widget.hotelName),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(AppSpacing.ms.w),
                itemCount: widget.rooms.length,
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSpacing.md.h),
                itemBuilder: (context, index) => RoomCard(
                  data: widget.rooms[index],
                  onPackageSelected: (package) =>
                      _onPackageSelected(widget.rooms[index], package),
                ),
              ),
            ),
            const StepIndicator(currentStep: 2, totalSteps: 3),
            BottomBar(
              secondaryWidget: PriceNightsBox(
                price: _selectedPackage?.price,
                numberOfNights: _selectedRoom?.numberOfNights,
                isHotel: true,
              ),
              ctaLabel: 'Continue',
              onCtaTap: _selectedRoom == null || _selectedPackage == null
                  ? null
                  : () => GoRouter.of(context).push(AppRoutes.bookingSummary,
                          extra: {
                            'isHotel': true,
                            'hotelData': kPlaceholderBookingDetails
                          }),
            ),
          ],
        ),
      ),
    );
  }
}
