// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(phoneNumber) => "A 4 digit code was sent to ${phoneNumber}.";

  static String m1(time) => "Resend code in ${time}";

  static String m2(count) => "${count} Person";

  static String m3(category, distance) => "${category} • ${distance} km";

  static String m4(count) => "${count} Seats left";

  static String m5(count) => "${count} Review";

  static String m6(label) => "${label} coming soon";

  static String m7(count) => "${count} Person";

  static String m8(phone) => "Call ${phone}";

  static String m9(price) => "Price : ${price}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("Bookly"),
        "authAlreadyHaveAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account? "),
        "authBackToLogin":
            MessageLookupByLibrary.simpleMessage("Back to Login"),
        "authConfirmPasswordLabel":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "authConfirmPasswordRequired": MessageLookupByLibrary.simpleMessage(
            "Confirm password is required"),
        "authContinueButton": MessageLookupByLibrary.simpleMessage("Continue"),
        "authCreateAccountSubtitle": MessageLookupByLibrary.simpleMessage(
            "Join us and start your journey"),
        "authCreateAccountTitle":
            MessageLookupByLibrary.simpleMessage("Create Account"),
        "authEmailInvalid":
            MessageLookupByLibrary.simpleMessage("Enter a valid email"),
        "authEmailLabel": MessageLookupByLibrary.simpleMessage("Email"),
        "authEmailRequired":
            MessageLookupByLibrary.simpleMessage("Email is required"),
        "authEnterPhoneNumber":
            MessageLookupByLibrary.simpleMessage("Enter your phone number"),
        "authFullNameLabel": MessageLookupByLibrary.simpleMessage("Full Name"),
        "authInvalidPhoneNumber": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid phone number"),
        "authJoinAsGuest":
            MessageLookupByLibrary.simpleMessage("Join As A Guest"),
        "authLogIn": MessageLookupByLibrary.simpleMessage("Log In"),
        "authMobileNumberHint":
            MessageLookupByLibrary.simpleMessage("Mobile Number"),
        "authNameRequired":
            MessageLookupByLibrary.simpleMessage("Name is required"),
        "authOtpNotice": MessageLookupByLibrary.simpleMessage(
            "A OTP will be sent to your phone number for verification."),
        "authOtpSentGeneric": MessageLookupByLibrary.simpleMessage(
            "Enter the 4 digit code sent to your phone."),
        "authOtpSentToPhone": m0,
        "authOtpTitle":
            MessageLookupByLibrary.simpleMessage("Enter verification code"),
        "authPasswordLabel": MessageLookupByLibrary.simpleMessage("Password"),
        "authPasswordRequired":
            MessageLookupByLibrary.simpleMessage("Password is required"),
        "authPasswordResetSuccess": MessageLookupByLibrary.simpleMessage(
            "Password reset link sent successfully"),
        "authPasswordTooShort": MessageLookupByLibrary.simpleMessage(
            "Password must be at least 6 characters"),
        "authPasswordsMismatch":
            MessageLookupByLibrary.simpleMessage("Passwords do not match"),
        "authResendCode": MessageLookupByLibrary.simpleMessage("Resend code"),
        "authResendCodeIn": m1,
        "authResetPasswordSubtitle": MessageLookupByLibrary.simpleMessage(
            "Enter your email to receive a reset link"),
        "authResetPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Reset Password"),
        "authSendResetLinkButton":
            MessageLookupByLibrary.simpleMessage("Send Reset Link"),
        "authSignUpButton": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "authVerifyButton": MessageLookupByLibrary.simpleMessage("Verify"),
        "bookingCategoryCafe": MessageLookupByLibrary.simpleMessage("Cafe"),
        "bookingCategoryHotels": MessageLookupByLibrary.simpleMessage("Hotels"),
        "bookingCategoryRestaurant":
            MessageLookupByLibrary.simpleMessage("Restaurant"),
        "bookingCheckInLabel": MessageLookupByLibrary.simpleMessage("Check In"),
        "bookingCheckOutLabel":
            MessageLookupByLibrary.simpleMessage("Check Out"),
        "bookingDetailsTitle":
            MessageLookupByLibrary.simpleMessage("Booking Details"),
        "bookingFeesLabel": MessageLookupByLibrary.simpleMessage("fees"),
        "bookingMyBookingSubtitle": MessageLookupByLibrary.simpleMessage(
            "View and manage all your reservations"),
        "bookingMyBookingTitle":
            MessageLookupByLibrary.simpleMessage("My Booking"),
        "bookingNoBookingsYetSubtitle": MessageLookupByLibrary.simpleMessage(
            "Your upcoming and past bookings will show up here."),
        "bookingNoBookingsYetTitle":
            MessageLookupByLibrary.simpleMessage("No bookings yet"),
        "bookingPaymentSummaryTitle":
            MessageLookupByLibrary.simpleMessage("Payment summary"),
        "bookingStatusAll": MessageLookupByLibrary.simpleMessage("All"),
        "bookingStatusCancelled":
            MessageLookupByLibrary.simpleMessage("Cancelled"),
        "bookingStatusCompleted":
            MessageLookupByLibrary.simpleMessage("Completed"),
        "bookingStatusUpcoming":
            MessageLookupByLibrary.simpleMessage("Upcoming"),
        "bookingSubtotalLabel":
            MessageLookupByLibrary.simpleMessage("Sub total"),
        "bookingTotalAmountLabel":
            MessageLookupByLibrary.simpleMessage("Total amount"),
        "bookingTotalStayLabel":
            MessageLookupByLibrary.simpleMessage("Total Stay"),
        "cafeAddNewCardLabel":
            MessageLookupByLibrary.simpleMessage("Add a new card"),
        "cafeAddNotePlaceholder":
            MessageLookupByLibrary.simpleMessage("Add a note"),
        "cafeAddNoteTitle": MessageLookupByLibrary.simpleMessage("Add Note"),
        "cafeAddPromoCodeTitle":
            MessageLookupByLibrary.simpleMessage("Add Promo Code"),
        "cafeApplyButton": MessageLookupByLibrary.simpleMessage("Apply"),
        "cafeBookTableTitle":
            MessageLookupByLibrary.simpleMessage("Book Table"),
        "cafeBookingHeaderTitle":
            MessageLookupByLibrary.simpleMessage("Booking Cafe"),
        "cafeBookingSummaryTitle":
            MessageLookupByLibrary.simpleMessage("Booking summary"),
        "cafeComingSoonTitle":
            MessageLookupByLibrary.simpleMessage("Coming Soon"),
        "cafeConfirmAndPayButton":
            MessageLookupByLibrary.simpleMessage("Confirm & pay"),
        "cafeContinueButton": MessageLookupByLibrary.simpleMessage("Continue"),
        "cafeDateLabel": MessageLookupByLibrary.simpleMessage("Date"),
        "cafeEnterPromoCodeHint":
            MessageLookupByLibrary.simpleMessage("Enter promo code"),
        "cafeFilterAll": MessageLookupByLibrary.simpleMessage("All"),
        "cafeFilterCoffee": MessageLookupByLibrary.simpleMessage("Coffee"),
        "cafeFilterDessert": MessageLookupByLibrary.simpleMessage("Dessert"),
        "cafeHoldReservationText": MessageLookupByLibrary.simpleMessage(
            "We hold Your reservation for "),
        "cafeHowManyPeopleTitle":
            MessageLookupByLibrary.simpleMessage("How Many People ?"),
        "cafeMenuTitle": MessageLookupByLibrary.simpleMessage("Menu"),
        "cafeNoteHint": MessageLookupByLibrary.simpleMessage(
            "Ex: I want to do a birthday party"),
        "cafeNoteLabel": MessageLookupByLibrary.simpleMessage("Note"),
        "cafeOptionLabel": MessageLookupByLibrary.simpleMessage("Option"),
        "cafePaymentSummaryTitle":
            MessageLookupByLibrary.simpleMessage("Payment summary"),
        "cafePersonCount": m2,
        "cafePersonLabel": MessageLookupByLibrary.simpleMessage("Person"),
        "cafePromoCodeAppliedMessage":
            MessageLookupByLibrary.simpleMessage("Promo code applied"),
        "cafePromoCodeHint": MessageLookupByLibrary.simpleMessage(
            "Use Promo Code to get more discount"),
        "cafeRemainingMoneyLabel":
            MessageLookupByLibrary.simpleMessage("Remaining money"),
        "cafeReservationTimeHint": MessageLookupByLibrary.simpleMessage(
            "From 1 hr , up to 14 days in Advance"),
        "cafeSelectDatePlaceholder":
            MessageLookupByLibrary.simpleMessage("Select date"),
        "cafeSelectOptionTitle":
            MessageLookupByLibrary.simpleMessage("Select Option"),
        "cafeSelectPaymentMethodTitle":
            MessageLookupByLibrary.simpleMessage("Select Payment Method"),
        "cafeSelectReservationTimeTitle":
            MessageLookupByLibrary.simpleMessage("Select Reservation Time"),
        "cafeSelectTimePlaceholder":
            MessageLookupByLibrary.simpleMessage("Select time"),
        "cafeTimeLabel": MessageLookupByLibrary.simpleMessage("Time"),
        "cafeTopRatedTitle":
            MessageLookupByLibrary.simpleMessage("Top Rated Places ⭐"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "commonErrorTitle":
            MessageLookupByLibrary.simpleMessage("Something went wrong"),
        "commonExtraAllFilterLabel":
            MessageLookupByLibrary.simpleMessage("All"),
        "commonExtraBookYourSeatsLabel":
            MessageLookupByLibrary.simpleMessage("Book your seats"),
        "commonExtraCategoryDistanceKm": m3,
        "commonExtraClosedLabel":
            MessageLookupByLibrary.simpleMessage("Closed"),
        "commonExtraComingSoonTitle":
            MessageLookupByLibrary.simpleMessage("Coming Soon"),
        "commonExtraCouldNotLoadNearbyPlaces":
            MessageLookupByLibrary.simpleMessage(
                "Could not load nearby places"),
        "commonExtraEgpCurrencyPrefix":
            MessageLookupByLibrary.simpleMessage("EGP "),
        "commonExtraFiltersComingSoonMessage":
            MessageLookupByLibrary.simpleMessage("Filters coming soon"),
        "commonExtraNearbyPlacesTitle":
            MessageLookupByLibrary.simpleMessage("Nearby Places"),
        "commonExtraNoNearbyPlacesFound":
            MessageLookupByLibrary.simpleMessage("No nearby places found"),
        "commonExtraSeatsLeftLabel": m4,
        "commonExtraTopRatedPlacesTitle":
            MessageLookupByLibrary.simpleMessage("Top Rated Places"),
        "commonNavFavorite": MessageLookupByLibrary.simpleMessage("Favorite"),
        "commonNavHome": MessageLookupByLibrary.simpleMessage("Home"),
        "commonNavMore": MessageLookupByLibrary.simpleMessage("More"),
        "commonNavMyBooking":
            MessageLookupByLibrary.simpleMessage("My Booking"),
        "commonRetryButton": MessageLookupByLibrary.simpleMessage("Try Again"),
        "completeInfoContinueButton":
            MessageLookupByLibrary.simpleMessage("Continue"),
        "completeInfoDobRequired": MessageLookupByLibrary.simpleMessage(
            "Please select your date of birth"),
        "completeInfoFullNameHint":
            MessageLookupByLibrary.simpleMessage("Enter your full name"),
        "completeInfoFullNameRequired":
            MessageLookupByLibrary.simpleMessage("Please enter your full name"),
        "completeInfoGenderFemale":
            MessageLookupByLibrary.simpleMessage("Female"),
        "completeInfoGenderLabel":
            MessageLookupByLibrary.simpleMessage("Gender"),
        "completeInfoGenderMale": MessageLookupByLibrary.simpleMessage("Male"),
        "completeInfoGenderRequired":
            MessageLookupByLibrary.simpleMessage("Please select your gender"),
        "completeInfoInterestBars":
            MessageLookupByLibrary.simpleMessage("Bars"),
        "completeInfoInterestCafes":
            MessageLookupByLibrary.simpleMessage("Cafes"),
        "completeInfoInterestFood":
            MessageLookupByLibrary.simpleMessage("Food"),
        "completeInfoInterestHotels":
            MessageLookupByLibrary.simpleMessage("Hotels"),
        "completeInfoInterestLabTest":
            MessageLookupByLibrary.simpleMessage("Lab Test"),
        "completeInfoInterestShopping":
            MessageLookupByLibrary.simpleMessage("Shopping"),
        "completeInfoInterestSpaWellness":
            MessageLookupByLibrary.simpleMessage("Spa & Wellness"),
        "completeInfoInterestsSubtitle": MessageLookupByLibrary.simpleMessage(
            "Get specific about things you love"),
        "completeInfoInterestsTitle":
            MessageLookupByLibrary.simpleMessage("Choose Your Interests"),
        "completeInfoSelectDob":
            MessageLookupByLibrary.simpleMessage("Select your date of birth"),
        "completeInfoSubtitle": MessageLookupByLibrary.simpleMessage(
            "Add your name and details to personalize your experience"),
        "completeInfoTitle":
            MessageLookupByLibrary.simpleMessage("Complete Your Information"),
        "favoritesCafesCategoryTitle":
            MessageLookupByLibrary.simpleMessage("Cafes"),
        "favoritesCafesScreenTitle":
            MessageLookupByLibrary.simpleMessage("Favorite Cafes"),
        "favoritesEmptySubtitle": MessageLookupByLibrary.simpleMessage(
            "Places and screenings you favorite will show up here."),
        "favoritesEmptyTitle":
            MessageLookupByLibrary.simpleMessage("No favorites yet"),
        "favoritesHotelsCategoryTitle":
            MessageLookupByLibrary.simpleMessage("Hotels"),
        "favoritesHotelsScreenTitle":
            MessageLookupByLibrary.simpleMessage("Favorite Hotels"),
        "favoritesMyFavoriteTitle":
            MessageLookupByLibrary.simpleMessage("My Favorite"),
        "favoritesPageTitle": MessageLookupByLibrary.simpleMessage("Favorite"),
        "favoritesRestaurantCategoryTitle":
            MessageLookupByLibrary.simpleMessage("Restaurant"),
        "favoritesRestaurantsScreenTitle":
            MessageLookupByLibrary.simpleMessage("Favorite Restaurant"),
        "favoritesReviewCount": m5,
        "helloWorld": MessageLookupByLibrary.simpleMessage("Hello World"),
        "homeAdsLoadError":
            MessageLookupByLibrary.simpleMessage("Could not load ads"),
        "homeCategoriesTitle":
            MessageLookupByLibrary.simpleMessage("Categories"),
        "homeCategoryCafe": MessageLookupByLibrary.simpleMessage("Cafe"),
        "homeCategoryCarRental":
            MessageLookupByLibrary.simpleMessage("Car Rental"),
        "homeCategoryComingSoonBadge":
            MessageLookupByLibrary.simpleMessage("Soon"),
        "homeCategoryComingSoonMessage": m6,
        "homeCategoryFlight": MessageLookupByLibrary.simpleMessage("Flight"),
        "homeCategoryHotels": MessageLookupByLibrary.simpleMessage("Hotels"),
        "homeCategoryLaboratory":
            MessageLookupByLibrary.simpleMessage("Laboratory"),
        "homeCategoryMore": MessageLookupByLibrary.simpleMessage("More"),
        "homeCategoryRestaurant":
            MessageLookupByLibrary.simpleMessage("Restaurant"),
        "homeNoNotificationsMessage":
            MessageLookupByLibrary.simpleMessage("No new notifications"),
        "homeSearchHint":
            MessageLookupByLibrary.simpleMessage("What are you looking for?"),
        "moreAccount": MessageLookupByLibrary.simpleMessage("Account"),
        "moreGreeting": MessageLookupByLibrary.simpleMessage("Hi"),
        "moreGuestFallbackName": MessageLookupByLibrary.simpleMessage("Guest"),
        "moreInviteFriend":
            MessageLookupByLibrary.simpleMessage("Invite Friend"),
        "moreLanguageTitle": MessageLookupByLibrary.simpleMessage("Language"),
        "moreLogout": MessageLookupByLibrary.simpleMessage("Log out"),
        "moreLogoutConfirm":
            MessageLookupByLibrary.simpleMessage("Yes Log out"),
        "moreLogoutConfirmMessage": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to log out?"),
        "moreNoNewNotifications":
            MessageLookupByLibrary.simpleMessage("No new notifications"),
        "morePromoCodes": MessageLookupByLibrary.simpleMessage("Promo Codes"),
        "moreSettings": MessageLookupByLibrary.simpleMessage("setting"),
        "moreSupport": MessageLookupByLibrary.simpleMessage("Support"),
        "moreUseDeviceLanguage":
            MessageLookupByLibrary.simpleMessage("Use device language"),
        "notificationsEmptyMessage": MessageLookupByLibrary.simpleMessage(
            "We\'ll let you know when there will be something to update you."),
        "notificationsEmptyTitle":
            MessageLookupByLibrary.simpleMessage("No Notifications"),
        "notificationsTitle":
            MessageLookupByLibrary.simpleMessage("Notification"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "onboardingGetStarted":
            MessageLookupByLibrary.simpleMessage("Get Started"),
        "onboardingJoinAsGuest":
            MessageLookupByLibrary.simpleMessage("Join as a Guest"),
        "onboardingPage1TitleLine1":
            MessageLookupByLibrary.simpleMessage("Compare Choose"),
        "onboardingPage1TitleLine2":
            MessageLookupByLibrary.simpleMessage("& Book"),
        "onboardingPage2TitleLine1":
            MessageLookupByLibrary.simpleMessage("One App Endless"),
        "onboardingPage2TitleLine2":
            MessageLookupByLibrary.simpleMessage("Bookings"),
        "onboardingSkip": MessageLookupByLibrary.simpleMessage("Skip"),
        "restaurantAddNewCardLabel":
            MessageLookupByLibrary.simpleMessage("Add a new card"),
        "restaurantAddNoteText":
            MessageLookupByLibrary.simpleMessage("Add a note"),
        "restaurantAddNoteTitle":
            MessageLookupByLibrary.simpleMessage("Add Note"),
        "restaurantAddPromoCodeTitle":
            MessageLookupByLibrary.simpleMessage("Add Promo Code"),
        "restaurantApplyLabel": MessageLookupByLibrary.simpleMessage("Apply"),
        "restaurantBookTableTitle":
            MessageLookupByLibrary.simpleMessage("Book Table"),
        "restaurantBookingHeaderTitle":
            MessageLookupByLibrary.simpleMessage("Booking Restaurant"),
        "restaurantBookingSummaryTitle":
            MessageLookupByLibrary.simpleMessage("Booking summary"),
        "restaurantComingSoonTitle":
            MessageLookupByLibrary.simpleMessage("Coming Soon"),
        "restaurantConfirmAndPayLabel":
            MessageLookupByLibrary.simpleMessage("Confirm & pay"),
        "restaurantContinueLabel":
            MessageLookupByLibrary.simpleMessage("Continue"),
        "restaurantDateLabel": MessageLookupByLibrary.simpleMessage("Date"),
        "restaurantFilterAll": MessageLookupByLibrary.simpleMessage("All"),
        "restaurantFilterBurger":
            MessageLookupByLibrary.simpleMessage("Burger"),
        "restaurantFilterPizza": MessageLookupByLibrary.simpleMessage("Pizza"),
        "restaurantHoldReservationMessage":
            MessageLookupByLibrary.simpleMessage(
                "We hold your reservation for"),
        "restaurantHowManyPeopleTitle":
            MessageLookupByLibrary.simpleMessage("How many people?"),
        "restaurantMenuTitle": MessageLookupByLibrary.simpleMessage("Menu"),
        "restaurantNoteHint": MessageLookupByLibrary.simpleMessage(
            "Ex: I want to do a birthday party"),
        "restaurantNoteLabel": MessageLookupByLibrary.simpleMessage("Note"),
        "restaurantOptionLabel": MessageLookupByLibrary.simpleMessage("Option"),
        "restaurantPartySizeValue": m7,
        "restaurantPaymentSummaryTitle":
            MessageLookupByLibrary.simpleMessage("Payment summary"),
        "restaurantPersonLabel": MessageLookupByLibrary.simpleMessage("Person"),
        "restaurantPromoCodeAppliedMessage":
            MessageLookupByLibrary.simpleMessage("Promo code applied"),
        "restaurantPromoCodeHint":
            MessageLookupByLibrary.simpleMessage("Enter promo code"),
        "restaurantPromoCodeSubtitle": MessageLookupByLibrary.simpleMessage(
            "Use Promo Code to get more discount"),
        "restaurantRemainingMoneyLabel":
            MessageLookupByLibrary.simpleMessage("Remaining money"),
        "restaurantReservationTimeHint": MessageLookupByLibrary.simpleMessage(
            "From 1 hr, up to 14 days in advance"),
        "restaurantSelectDatePlaceholder":
            MessageLookupByLibrary.simpleMessage("Select date"),
        "restaurantSelectOptionTitle":
            MessageLookupByLibrary.simpleMessage("Select Option"),
        "restaurantSelectPaymentMethodTitle":
            MessageLookupByLibrary.simpleMessage("Select Payment Method"),
        "restaurantSelectReservationTimeTitle":
            MessageLookupByLibrary.simpleMessage("Select Reservation Time"),
        "restaurantSelectTimePlaceholder":
            MessageLookupByLibrary.simpleMessage("Select time"),
        "restaurantTimeLabel": MessageLookupByLibrary.simpleMessage("Time"),
        "restaurantTopRatedTitle":
            MessageLookupByLibrary.simpleMessage("Top Rated Places ⭐"),
        "splashSubtitle":
            MessageLookupByLibrary.simpleMessage("One App Every Booking"),
        "venueAboutSeeMore": MessageLookupByLibrary.simpleMessage("See more"),
        "venueAboutTitle": MessageLookupByLibrary.simpleMessage("About"),
        "venueAmLabel": MessageLookupByLibrary.simpleMessage("AM"),
        "venueBackToHomeButton":
            MessageLookupByLibrary.simpleMessage("Back to home"),
        "venueBookTableButton":
            MessageLookupByLibrary.simpleMessage("Book Table"),
        "venueBookingConfirmedMessage": MessageLookupByLibrary.simpleMessage(
            "your Table has been reserved with successfully"),
        "venueBookingConfirmedTitle":
            MessageLookupByLibrary.simpleMessage("Booking Confirmed"),
        "venueBookingIdLabel":
            MessageLookupByLibrary.simpleMessage("Booking ID"),
        "venueCalendarFri": MessageLookupByLibrary.simpleMessage("FRI"),
        "venueCalendarMon": MessageLookupByLibrary.simpleMessage("MON"),
        "venueCalendarSat": MessageLookupByLibrary.simpleMessage("SAT"),
        "venueCalendarSun": MessageLookupByLibrary.simpleMessage("SUN"),
        "venueCalendarThu": MessageLookupByLibrary.simpleMessage("THU"),
        "venueCalendarTue": MessageLookupByLibrary.simpleMessage("TUE"),
        "venueCalendarWed": MessageLookupByLibrary.simpleMessage("WED"),
        "venueCallPhoneLabel": m8,
        "venueClosedAtLabel": MessageLookupByLibrary.simpleMessage("Closed at"),
        "venueDateLabel": MessageLookupByLibrary.simpleMessage("Date"),
        "venueDepositNeedLabel":
            MessageLookupByLibrary.simpleMessage("Deposite Need : "),
        "venueFacilitiesSeeMore":
            MessageLookupByLibrary.simpleMessage("See More"),
        "venueFacilitiesTitle":
            MessageLookupByLibrary.simpleMessage("Facilities"),
        "venueFeesLabel": MessageLookupByLibrary.simpleMessage("fees"),
        "venueFiltersComingSoonMessage":
            MessageLookupByLibrary.simpleMessage("Filters coming soon"),
        "venueFromYourLocationLabel":
            MessageLookupByLibrary.simpleMessage("From Your location"),
        "venueLocationTitle": MessageLookupByLibrary.simpleMessage("Location"),
        "venueMenuLabel": MessageLookupByLibrary.simpleMessage("Menu"),
        "venueNextButton": MessageLookupByLibrary.simpleMessage("Next"),
        "venueOpeningAtLabel":
            MessageLookupByLibrary.simpleMessage("Opening at"),
        "venuePaymentMethodApplePay":
            MessageLookupByLibrary.simpleMessage("Apple pay"),
        "venuePaymentMethodLabel":
            MessageLookupByLibrary.simpleMessage("Payment method"),
        "venuePaymentMethodNewCard":
            MessageLookupByLibrary.simpleMessage("New card"),
        "venuePaymentSummaryTitle":
            MessageLookupByLibrary.simpleMessage("Payment summary"),
        "venuePerPersonSuffix": MessageLookupByLibrary.simpleMessage("/Person"),
        "venuePmLabel": MessageLookupByLibrary.simpleMessage("PM"),
        "venuePolicyTitle": MessageLookupByLibrary.simpleMessage("Policy"),
        "venuePriceLabel": m9,
        "venueReviewLabel": MessageLookupByLibrary.simpleMessage("Review "),
        "venueSeeLocationOnMapButton":
            MessageLookupByLibrary.simpleMessage("See Location on map"),
        "venueSubTotalLabel": MessageLookupByLibrary.simpleMessage("Sub total"),
        "venueTimeLabel": MessageLookupByLibrary.simpleMessage("Time"),
        "venueTotalAmountLabel":
            MessageLookupByLibrary.simpleMessage("Total amount"),
        "venueViewBookingDetailsButton":
            MessageLookupByLibrary.simpleMessage("View Booking Details")
      };
}
