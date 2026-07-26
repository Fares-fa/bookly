// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Bookly`
  String get appName {
    return Intl.message(
      'Bookly',
      name: 'appName',
      desc: 'The application name',
      args: [],
    );
  }

  /// `Hello World`
  String get helloWorld {
    return Intl.message(
      'Hello World',
      name: 'helloWorld',
      desc: 'Sample greeting used to verify the localization pipeline',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: 'Generic confirmation button label',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: 'Generic cancel button label',
      args: [],
    );
  }

  /// `Something went wrong`
  String get commonErrorTitle {
    return Intl.message(
      'Something went wrong',
      name: 'commonErrorTitle',
      desc: 'Default title shown on the generic error state widget when no custom title is provided',
      args: [],
    );
  }

  /// `Try Again`
  String get commonRetryButton {
    return Intl.message(
      'Try Again',
      name: 'commonRetryButton',
      desc: 'Default label for the retry button on the generic error state widget',
      args: [],
    );
  }

  /// `Home`
  String get commonNavHome {
    return Intl.message(
      'Home',
      name: 'commonNavHome',
      desc: 'Bottom navigation bar tab label for the Home tab',
      args: [],
    );
  }

  /// `My Booking`
  String get commonNavMyBooking {
    return Intl.message(
      'My Booking',
      name: 'commonNavMyBooking',
      desc: 'Bottom navigation bar tab label for the My Booking tab',
      args: [],
    );
  }

  /// `Favorite`
  String get commonNavFavorite {
    return Intl.message(
      'Favorite',
      name: 'commonNavFavorite',
      desc: 'Bottom navigation bar tab label for the Favorite tab',
      args: [],
    );
  }

  /// `More`
  String get commonNavMore {
    return Intl.message(
      'More',
      name: 'commonNavMore',
      desc: 'Bottom navigation bar tab label for the More tab',
      args: [],
    );
  }

  /// `Hotels`
  String get bookingCategoryHotels {
    return Intl.message(
      'Hotels',
      name: 'bookingCategoryHotels',
      desc: 'Booking category label: hotels',
      args: [],
    );
  }

  /// `Restaurant`
  String get bookingCategoryRestaurant {
    return Intl.message(
      'Restaurant',
      name: 'bookingCategoryRestaurant',
      desc: 'Booking category label: restaurants',
      args: [],
    );
  }

  /// `Cafe`
  String get bookingCategoryCafe {
    return Intl.message(
      'Cafe',
      name: 'bookingCategoryCafe',
      desc: 'Booking category label: cafes',
      args: [],
    );
  }

  /// `My Booking`
  String get bookingMyBookingTitle {
    return Intl.message(
      'My Booking',
      name: 'bookingMyBookingTitle',
      desc: 'Title of the My Booking screen/tab',
      args: [],
    );
  }

  /// `View and manage all your reservations`
  String get bookingMyBookingSubtitle {
    return Intl.message(
      'View and manage all your reservations',
      name: 'bookingMyBookingSubtitle',
      desc: 'Subtitle shown under the My Booking screen title',
      args: [],
    );
  }

  /// `No bookings yet`
  String get bookingNoBookingsYetTitle {
    return Intl.message(
      'No bookings yet',
      name: 'bookingNoBookingsYetTitle',
      desc: 'Empty state title on the placeholder My Booking tab',
      args: [],
    );
  }

  /// `Your upcoming and past bookings will show up here.`
  String get bookingNoBookingsYetSubtitle {
    return Intl.message(
      'Your upcoming and past bookings will show up here.',
      name: 'bookingNoBookingsYetSubtitle',
      desc: 'Empty state subtitle on the placeholder My Booking tab',
      args: [],
    );
  }

  /// `All`
  String get bookingStatusAll {
    return Intl.message(
      'All',
      name: 'bookingStatusAll',
      desc: 'Booking status filter tab: all bookings',
      args: [],
    );
  }

  /// `Upcoming`
  String get bookingStatusUpcoming {
    return Intl.message(
      'Upcoming',
      name: 'bookingStatusUpcoming',
      desc: 'Booking status filter tab: upcoming bookings',
      args: [],
    );
  }

  /// `Completed`
  String get bookingStatusCompleted {
    return Intl.message(
      'Completed',
      name: 'bookingStatusCompleted',
      desc: 'Booking status filter tab: completed bookings',
      args: [],
    );
  }

  /// `Cancelled`
  String get bookingStatusCancelled {
    return Intl.message(
      'Cancelled',
      name: 'bookingStatusCancelled',
      desc: 'Booking status filter tab: cancelled bookings',
      args: [],
    );
  }

  /// `Booking Details`
  String get bookingDetailsTitle {
    return Intl.message(
      'Booking Details',
      name: 'bookingDetailsTitle',
      desc: 'Title of the Booking Details screen',
      args: [],
    );
  }

  /// `Check In`
  String get bookingCheckInLabel {
    return Intl.message(
      'Check In',
      name: 'bookingCheckInLabel',
      desc: 'Label for the check-in date/time column on the booking details screen',
      args: [],
    );
  }

  /// `Check Out`
  String get bookingCheckOutLabel {
    return Intl.message(
      'Check Out',
      name: 'bookingCheckOutLabel',
      desc: 'Label for the check-out date/time column on the booking details screen',
      args: [],
    );
  }

  /// `Total Stay`
  String get bookingTotalStayLabel {
    return Intl.message(
      'Total Stay',
      name: 'bookingTotalStayLabel',
      desc: 'Label for the total stay length column on the booking details screen',
      args: [],
    );
  }

  /// `Payment summary`
  String get bookingPaymentSummaryTitle {
    return Intl.message(
      'Payment summary',
      name: 'bookingPaymentSummaryTitle',
      desc:
          'Title of the payment summary section on the booking details screen',
      args: [],
    );
  }

  /// `Sub total`
  String get bookingSubtotalLabel {
    return Intl.message(
      'Sub total',
      name: 'bookingSubtotalLabel',
      desc: 'Label for the subtotal row in the payment summary',
      args: [],
    );
  }

  /// `fees`
  String get bookingFeesLabel {
    return Intl.message(
      'fees',
      name: 'bookingFeesLabel',
      desc: 'Label for the fees row in the payment summary',
      args: [],
    );
  }

  /// `Total amount`
  String get bookingTotalAmountLabel {
    return Intl.message(
      'Total amount',
      name: 'bookingTotalAmountLabel',
      desc: 'Label for the total amount row in the payment summary',
      args: [],
    );
  }

  /// `Reset Password`
  String get authResetPasswordTitle {
    return Intl.message(
      'Reset Password',
      name: 'authResetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email to receive a reset link`
  String get authResetPasswordSubtitle {
    return Intl.message(
      'Enter your email to receive a reset link',
      name: 'authResetPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get authEmailLabel {
    return Intl.message('Email', name: 'authEmailLabel', desc: '', args: []);
  }

  /// `Email is required`
  String get authEmailRequired {
    return Intl.message(
      'Email is required',
      name: 'authEmailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get authEmailInvalid {
    return Intl.message(
      'Enter a valid email',
      name: 'authEmailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Send Reset Link`
  String get authSendResetLinkButton {
    return Intl.message(
      'Send Reset Link',
      name: 'authSendResetLinkButton',
      desc: '',
      args: [],
    );
  }

  /// `Back to Login`
  String get authBackToLogin {
    return Intl.message(
      'Back to Login',
      name: 'authBackToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get authEnterPhoneNumber {
    return Intl.message(
      'Enter your phone number',
      name: 'authEnterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `A OTP will be sent to your phone number for verification.`
  String get authOtpNotice {
    return Intl.message(
      'A OTP will be sent to your phone number for verification.',
      name: 'authOtpNotice',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get authContinueButton {
    return Intl.message(
      'Continue',
      name: 'authContinueButton',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get authCreateAccountTitle {
    return Intl.message(
      'Create Account',
      name: 'authCreateAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `Join us and start your journey`
  String get authCreateAccountSubtitle {
    return Intl.message(
      'Join us and start your journey',
      name: 'authCreateAccountSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get authFullNameLabel {
    return Intl.message(
      'Full Name',
      name: 'authFullNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Name is required`
  String get authNameRequired {
    return Intl.message(
      'Name is required',
      name: 'authNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get authPasswordLabel {
    return Intl.message(
      'Password',
      name: 'authPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get authPasswordRequired {
    return Intl.message(
      'Password is required',
      name: 'authPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get authPasswordTooShort {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'authPasswordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get authConfirmPasswordLabel {
    return Intl.message(
      'Confirm Password',
      name: 'authConfirmPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password is required`
  String get authConfirmPasswordRequired {
    return Intl.message(
      'Confirm password is required',
      name: 'authConfirmPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get authPasswordsMismatch {
    return Intl.message(
      'Passwords do not match',
      name: 'authPasswordsMismatch',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get authSignUpButton {
    return Intl.message(
      'Sign Up',
      name: 'authSignUpButton',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get authAlreadyHaveAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'authAlreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get authLogIn {
    return Intl.message('Log In', name: 'authLogIn', desc: '', args: []);
  }

  /// `Join As A Guest`
  String get authJoinAsGuest {
    return Intl.message(
      'Join As A Guest',
      name: 'authJoinAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get authMobileNumberHint {
    return Intl.message(
      'Mobile Number',
      name: 'authMobileNumberHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get authInvalidPhoneNumber {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'authInvalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter verification code`
  String get authOtpTitle {
    return Intl.message(
      'Enter verification code',
      name: 'authOtpTitle',
      desc: '',
      args: [],
    );
  }

  /// `A 4 digit code was sent to {phoneNumber}.`
  String authOtpSentToPhone(String phoneNumber) {
    return Intl.message(
      'A 4 digit code was sent to $phoneNumber.',
      name: 'authOtpSentToPhone',
      desc: '',
      args: [phoneNumber],
    );
  }

  /// `Enter the 4 digit code sent to your phone.`
  String get authOtpSentGeneric {
    return Intl.message(
      'Enter the 4 digit code sent to your phone.',
      name: 'authOtpSentGeneric',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get authResendCode {
    return Intl.message(
      'Resend code',
      name: 'authResendCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend code in {time}`
  String authResendCodeIn(String time) {
    return Intl.message(
      'Resend code in $time',
      name: 'authResendCodeIn',
      desc: '',
      args: [time],
    );
  }

  /// `Verify`
  String get authVerifyButton {
    return Intl.message('Verify', name: 'authVerifyButton', desc: '', args: []);
  }

  /// `Password reset link sent successfully`
  String get authPasswordResetSuccess {
    return Intl.message(
      'Password reset link sent successfully',
      name: 'authPasswordResetSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get completeInfoContinueButton {
    return Intl.message(
      'Continue',
      name: 'completeInfoContinueButton',
      desc: '',
      args: [],
    );
  }

  /// `Food`
  String get completeInfoInterestFood {
    return Intl.message(
      'Food',
      name: 'completeInfoInterestFood',
      desc: '',
      args: [],
    );
  }

  /// `Cafes`
  String get completeInfoInterestCafes {
    return Intl.message(
      'Cafes',
      name: 'completeInfoInterestCafes',
      desc: '',
      args: [],
    );
  }

  /// `Hotels`
  String get completeInfoInterestHotels {
    return Intl.message(
      'Hotels',
      name: 'completeInfoInterestHotels',
      desc: '',
      args: [],
    );
  }

  /// `Spa & Wellness`
  String get completeInfoInterestSpaWellness {
    return Intl.message(
      'Spa & Wellness',
      name: 'completeInfoInterestSpaWellness',
      desc: '',
      args: [],
    );
  }

  /// `Bars`
  String get completeInfoInterestBars {
    return Intl.message(
      'Bars',
      name: 'completeInfoInterestBars',
      desc: '',
      args: [],
    );
  }

  /// `Shopping`
  String get completeInfoInterestShopping {
    return Intl.message(
      'Shopping',
      name: 'completeInfoInterestShopping',
      desc: '',
      args: [],
    );
  }

  /// `Lab Test`
  String get completeInfoInterestLabTest {
    return Intl.message(
      'Lab Test',
      name: 'completeInfoInterestLabTest',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your Interests`
  String get completeInfoInterestsTitle {
    return Intl.message(
      'Choose Your Interests',
      name: 'completeInfoInterestsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Get specific about things you love`
  String get completeInfoInterestsSubtitle {
    return Intl.message(
      'Get specific about things you love',
      name: 'completeInfoInterestsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Complete Your Information`
  String get completeInfoTitle {
    return Intl.message(
      'Complete Your Information',
      name: 'completeInfoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add your name and details to personalize your experience`
  String get completeInfoSubtitle {
    return Intl.message(
      'Add your name and details to personalize your experience',
      name: 'completeInfoSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your full name`
  String get completeInfoFullNameHint {
    return Intl.message(
      'Enter your full name',
      name: 'completeInfoFullNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your full name`
  String get completeInfoFullNameRequired {
    return Intl.message(
      'Please enter your full name',
      name: 'completeInfoFullNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please select your date of birth`
  String get completeInfoDobRequired {
    return Intl.message(
      'Please select your date of birth',
      name: 'completeInfoDobRequired',
      desc: '',
      args: [],
    );
  }

  /// `Select your date of birth`
  String get completeInfoSelectDob {
    return Intl.message(
      'Select your date of birth',
      name: 'completeInfoSelectDob',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get completeInfoGenderLabel {
    return Intl.message(
      'Gender',
      name: 'completeInfoGenderLabel',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get completeInfoGenderMale {
    return Intl.message(
      'Male',
      name: 'completeInfoGenderMale',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get completeInfoGenderFemale {
    return Intl.message(
      'Female',
      name: 'completeInfoGenderFemale',
      desc: '',
      args: [],
    );
  }

  /// `Please select your gender`
  String get completeInfoGenderRequired {
    return Intl.message(
      'Please select your gender',
      name: 'completeInfoGenderRequired',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get moreAccount {
    return Intl.message('Account', name: 'moreAccount', desc: '', args: []);
  }

  /// `Support`
  String get moreSupport {
    return Intl.message('Support', name: 'moreSupport', desc: '', args: []);
  }

  /// `setting`
  String get moreSettings {
    return Intl.message('setting', name: 'moreSettings', desc: '', args: []);
  }

  /// `Promo Codes`
  String get morePromoCodes {
    return Intl.message(
      'Promo Codes',
      name: 'morePromoCodes',
      desc: '',
      args: [],
    );
  }

  /// `Invite Friend`
  String get moreInviteFriend {
    return Intl.message(
      'Invite Friend',
      name: 'moreInviteFriend',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get moreLogout {
    return Intl.message('Log out', name: 'moreLogout', desc: '', args: []);
  }

  /// `Are you sure you want to log out?`
  String get moreLogoutConfirmMessage {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'moreLogoutConfirmMessage',
      desc: '',
      args: [],
    );
  }

  /// `Yes Log out`
  String get moreLogoutConfirm {
    return Intl.message(
      'Yes Log out',
      name: 'moreLogoutConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Hi`
  String get moreGreeting {
    return Intl.message('Hi', name: 'moreGreeting', desc: '', args: []);
  }

  /// `Guest`
  String get moreGuestFallbackName {
    return Intl.message(
      'Guest',
      name: 'moreGuestFallbackName',
      desc: '',
      args: [],
    );
  }

  /// `No new notifications`
  String get moreNoNewNotifications {
    return Intl.message(
      'No new notifications',
      name: 'moreNoNewNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get moreLanguageTitle {
    return Intl.message(
      'Language',
      name: 'moreLanguageTitle',
      desc: 'More menu item label that opens the language picker sheet',
      args: [],
    );
  }

  /// `Use device language`
  String get moreUseDeviceLanguage {
    return Intl.message(
      'Use device language',
      name: 'moreUseDeviceLanguage',
      desc: 'Option in the language picker sheet that follows the device\'s system language instead of a manually chosen one',
      args: [],
    );
  }

  /// `Notification`
  String get notificationsTitle {
    return Intl.message(
      'Notification',
      name: 'notificationsTitle',
      desc: '',
      args: [],
    );
  }

  /// `No Notifications`
  String get notificationsEmptyTitle {
    return Intl.message(
      'No Notifications',
      name: 'notificationsEmptyTitle',
      desc: '',
      args: [],
    );
  }

  /// `We'll let you know when there will be something to update you.`
  String get notificationsEmptyMessage {
    return Intl.message(
      'We\'ll let you know when there will be something to update you.',
      name: 'notificationsEmptyMessage',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get onboardingSkip {
    return Intl.message('Skip', name: 'onboardingSkip', desc: '', args: []);
  }

  /// `Get Started`
  String get onboardingGetStarted {
    return Intl.message(
      'Get Started',
      name: 'onboardingGetStarted',
      desc: '',
      args: [],
    );
  }

  /// `Join as a Guest`
  String get onboardingJoinAsGuest {
    return Intl.message(
      'Join as a Guest',
      name: 'onboardingJoinAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `Compare Choose`
  String get onboardingPage1TitleLine1 {
    return Intl.message(
      'Compare Choose',
      name: 'onboardingPage1TitleLine1',
      desc: '',
      args: [],
    );
  }

  /// `& Book`
  String get onboardingPage1TitleLine2 {
    return Intl.message(
      '& Book',
      name: 'onboardingPage1TitleLine2',
      desc: '',
      args: [],
    );
  }

  /// `One App Endless`
  String get onboardingPage2TitleLine1 {
    return Intl.message(
      'One App Endless',
      name: 'onboardingPage2TitleLine1',
      desc: '',
      args: [],
    );
  }

  /// `Bookings`
  String get onboardingPage2TitleLine2 {
    return Intl.message(
      'Bookings',
      name: 'onboardingPage2TitleLine2',
      desc: '',
      args: [],
    );
  }

  /// `One App Every Booking`
  String get splashSubtitle {
    return Intl.message(
      'One App Every Booking',
      name: 'splashSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Coming Soon`
  String get commonExtraComingSoonTitle {
    return Intl.message(
      'Coming Soon',
      name: 'commonExtraComingSoonTitle',
      desc: 'Fallback heading for the Coming Soon teaser section when no title is provided',
      args: [],
    );
  }

  /// `{count} Seats left`
  String commonExtraSeatsLeftLabel(String count) {
    return Intl.message(
      '$count Seats left',
      name: 'commonExtraSeatsLeftLabel',
      desc: 'Badge label showing how many seats remain for a live screening',
      args: [count],
    );
  }

  /// `EGP `
  String get commonExtraEgpCurrencyPrefix {
    return Intl.message(
      'EGP ',
      name: 'commonExtraEgpCurrencyPrefix',
      desc: 'Currency prefix shown before a price value (note trailing space)',
      args: [],
    );
  }

  /// `{category} • {distance} km`
  String commonExtraCategoryDistanceKm(String category, String distance) {
    return Intl.message(
      '$category • $distance km',
      name: 'commonExtraCategoryDistanceKm',
      desc: 'Caption combining a place/screening category with its distance in kilometers',
      args: [category, distance],
    );
  }

  /// `Book your seats`
  String get commonExtraBookYourSeatsLabel {
    return Intl.message(
      'Book your seats',
      name: 'commonExtraBookYourSeatsLabel',
      desc: 'Button label to book seats for a live screening',
      args: [],
    );
  }

  /// `Closed`
  String get commonExtraClosedLabel {
    return Intl.message(
      'Closed',
      name: 'commonExtraClosedLabel',
      desc: 'Status badge shown on a nearby place card when the place is not open',
      args: [],
    );
  }

  /// `Nearby Places`
  String get commonExtraNearbyPlacesTitle {
    return Intl.message(
      'Nearby Places',
      name: 'commonExtraNearbyPlacesTitle',
      desc: 'Fallback section title for the Nearby Places section',
      args: [],
    );
  }

  /// `No nearby places found`
  String get commonExtraNoNearbyPlacesFound {
    return Intl.message(
      'No nearby places found',
      name: 'commonExtraNoNearbyPlacesFound',
      desc: 'Empty state message when no nearby places are available',
      args: [],
    );
  }

  /// `Could not load nearby places`
  String get commonExtraCouldNotLoadNearbyPlaces {
    return Intl.message(
      'Could not load nearby places',
      name: 'commonExtraCouldNotLoadNearbyPlaces',
      desc: 'Error message when nearby places fail to load',
      args: [],
    );
  }

  /// `All`
  String get commonExtraAllFilterLabel {
    return Intl.message(
      'All',
      name: 'commonExtraAllFilterLabel',
      desc: 'Default label for the filter chip on a card section',
      args: [],
    );
  }

  /// `Filters coming soon`
  String get commonExtraFiltersComingSoonMessage {
    return Intl.message(
      'Filters coming soon',
      name: 'commonExtraFiltersComingSoonMessage',
      desc: 'Snackbar message shown when a section\'s filter action has no handler yet',
      args: [],
    );
  }

  /// `Top Rated Places`
  String get commonExtraTopRatedPlacesTitle {
    return Intl.message(
      'Top Rated Places',
      name: 'commonExtraTopRatedPlacesTitle',
      desc: 'Fallback section title for the Top Rated Places section',
      args: [],
    );
  }

  /// `Favorite Hotels`
  String get favoritesHotelsScreenTitle {
    return Intl.message(
      'Favorite Hotels',
      name: 'favoritesHotelsScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Restaurant`
  String get favoritesRestaurantsScreenTitle {
    return Intl.message(
      'Favorite Restaurant',
      name: 'favoritesRestaurantsScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Cafes`
  String get favoritesCafesScreenTitle {
    return Intl.message(
      'Favorite Cafes',
      name: 'favoritesCafesScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favoritesPageTitle {
    return Intl.message(
      'Favorite',
      name: 'favoritesPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `No favorites yet`
  String get favoritesEmptyTitle {
    return Intl.message(
      'No favorites yet',
      name: 'favoritesEmptyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Places and screenings you favorite will show up here.`
  String get favoritesEmptySubtitle {
    return Intl.message(
      'Places and screenings you favorite will show up here.',
      name: 'favoritesEmptySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `My Favorite`
  String get favoritesMyFavoriteTitle {
    return Intl.message(
      'My Favorite',
      name: 'favoritesMyFavoriteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Hotels`
  String get favoritesHotelsCategoryTitle {
    return Intl.message(
      'Hotels',
      name: 'favoritesHotelsCategoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant`
  String get favoritesRestaurantCategoryTitle {
    return Intl.message(
      'Restaurant',
      name: 'favoritesRestaurantCategoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cafes`
  String get favoritesCafesCategoryTitle {
    return Intl.message(
      'Cafes',
      name: 'favoritesCafesCategoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `{count} Review`
  String favoritesReviewCount(String count) {
    return Intl.message(
      '$count Review',
      name: 'favoritesReviewCount',
      desc: '',
      args: [count],
    );
  }

  /// `Book Table`
  String get cafeBookTableTitle {
    return Intl.message(
      'Book Table',
      name: 'cafeBookTableTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select Reservation Time`
  String get cafeSelectReservationTimeTitle {
    return Intl.message(
      'Select Reservation Time',
      name: 'cafeSelectReservationTimeTitle',
      desc: '',
      args: [],
    );
  }

  /// `From 1 hr , up to 14 days in Advance`
  String get cafeReservationTimeHint {
    return Intl.message(
      'From 1 hr , up to 14 days in Advance',
      name: 'cafeReservationTimeHint',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get cafeDateLabel {
    return Intl.message('Date', name: 'cafeDateLabel', desc: '', args: []);
  }

  /// `Select date`
  String get cafeSelectDatePlaceholder {
    return Intl.message(
      'Select date',
      name: 'cafeSelectDatePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get cafeTimeLabel {
    return Intl.message('Time', name: 'cafeTimeLabel', desc: '', args: []);
  }

  /// `Select time`
  String get cafeSelectTimePlaceholder {
    return Intl.message(
      'Select time',
      name: 'cafeSelectTimePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get cafeContinueButton {
    return Intl.message(
      'Continue',
      name: 'cafeContinueButton',
      desc: '',
      args: [],
    );
  }

  /// `Booking Cafe`
  String get cafeBookingHeaderTitle {
    return Intl.message(
      'Booking Cafe',
      name: 'cafeBookingHeaderTitle',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get cafeFilterAll {
    return Intl.message('All', name: 'cafeFilterAll', desc: '', args: []);
  }

  /// `Coffee`
  String get cafeFilterCoffee {
    return Intl.message('Coffee', name: 'cafeFilterCoffee', desc: '', args: []);
  }

  /// `Dessert`
  String get cafeFilterDessert {
    return Intl.message(
      'Dessert',
      name: 'cafeFilterDessert',
      desc: '',
      args: [],
    );
  }

  /// `Top Rated Places ⭐`
  String get cafeTopRatedTitle {
    return Intl.message(
      'Top Rated Places ⭐',
      name: 'cafeTopRatedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Coming Soon`
  String get cafeComingSoonTitle {
    return Intl.message(
      'Coming Soon',
      name: 'cafeComingSoonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Booking summary`
  String get cafeBookingSummaryTitle {
    return Intl.message(
      'Booking summary',
      name: 'cafeBookingSummaryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Promo Code`
  String get cafeAddPromoCodeTitle {
    return Intl.message(
      'Add Promo Code',
      name: 'cafeAddPromoCodeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Use Promo Code to get more discount`
  String get cafePromoCodeHint {
    return Intl.message(
      'Use Promo Code to get more discount',
      name: 'cafePromoCodeHint',
      desc: '',
      args: [],
    );
  }

  /// `Select Payment Method`
  String get cafeSelectPaymentMethodTitle {
    return Intl.message(
      'Select Payment Method',
      name: 'cafeSelectPaymentMethodTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add a new card`
  String get cafeAddNewCardLabel {
    return Intl.message(
      'Add a new card',
      name: 'cafeAddNewCardLabel',
      desc: '',
      args: [],
    );
  }

  /// `Payment summary`
  String get cafePaymentSummaryTitle {
    return Intl.message(
      'Payment summary',
      name: 'cafePaymentSummaryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Confirm & pay`
  String get cafeConfirmAndPayButton {
    return Intl.message(
      'Confirm & pay',
      name: 'cafeConfirmAndPayButton',
      desc: '',
      args: [],
    );
  }

  /// `We hold Your reservation for `
  String get cafeHoldReservationText {
    return Intl.message(
      'We hold Your reservation for ',
      name: 'cafeHoldReservationText',
      desc: '',
      args: [],
    );
  }

  /// `Person`
  String get cafePersonLabel {
    return Intl.message('Person', name: 'cafePersonLabel', desc: '', args: []);
  }

  /// `{count} Person`
  String cafePersonCount(String count) {
    return Intl.message(
      '$count Person',
      name: 'cafePersonCount',
      desc: '',
      args: [count],
    );
  }

  /// `Option`
  String get cafeOptionLabel {
    return Intl.message('Option', name: 'cafeOptionLabel', desc: '', args: []);
  }

  /// `Note`
  String get cafeNoteLabel {
    return Intl.message('Note', name: 'cafeNoteLabel', desc: '', args: []);
  }

  /// `Add a note`
  String get cafeAddNotePlaceholder {
    return Intl.message(
      'Add a note',
      name: 'cafeAddNotePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Remaining money`
  String get cafeRemainingMoneyLabel {
    return Intl.message(
      'Remaining money',
      name: 'cafeRemainingMoneyLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter promo code`
  String get cafeEnterPromoCodeHint {
    return Intl.message(
      'Enter promo code',
      name: 'cafeEnterPromoCodeHint',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get cafeApplyButton {
    return Intl.message('Apply', name: 'cafeApplyButton', desc: '', args: []);
  }

  /// `Promo code applied`
  String get cafePromoCodeAppliedMessage {
    return Intl.message(
      'Promo code applied',
      name: 'cafePromoCodeAppliedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get cafeMenuTitle {
    return Intl.message('Menu', name: 'cafeMenuTitle', desc: '', args: []);
  }

  /// `How Many People ?`
  String get cafeHowManyPeopleTitle {
    return Intl.message(
      'How Many People ?',
      name: 'cafeHowManyPeopleTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select Option`
  String get cafeSelectOptionTitle {
    return Intl.message(
      'Select Option',
      name: 'cafeSelectOptionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Note`
  String get cafeAddNoteTitle {
    return Intl.message(
      'Add Note',
      name: 'cafeAddNoteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ex: I want to do a birthday party`
  String get cafeNoteHint {
    return Intl.message(
      'Ex: I want to do a birthday party',
      name: 'cafeNoteHint',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get homeCategoriesTitle {
    return Intl.message(
      'Categories',
      name: 'homeCategoriesTitle',
      desc: 'Title of the full categories grid screen',
      args: [],
    );
  }

  /// `Could not load ads`
  String get homeAdsLoadError {
    return Intl.message(
      'Could not load ads',
      name: 'homeAdsLoadError',
      desc: 'Error message shown when the home ad banners fail to load',
      args: [],
    );
  }

  /// `Soon`
  String get homeCategoryComingSoonBadge {
    return Intl.message(
      'Soon',
      name: 'homeCategoryComingSoonBadge',
      desc: 'Ribbon badge on a category tile that isn\'t live yet',
      args: [],
    );
  }

  /// `{label} coming soon`
  String homeCategoryComingSoonMessage(String label) {
    return Intl.message(
      '$label coming soon',
      name: 'homeCategoryComingSoonMessage',
      desc: 'Snackbar shown when tapping a category with no destination yet',
      args: [label],
    );
  }

  /// `No new notifications`
  String get homeNoNotificationsMessage {
    return Intl.message(
      'No new notifications',
      name: 'homeNoNotificationsMessage',
      desc:
          'Snackbar shown when tapping the notification bell with nothing new',
      args: [],
    );
  }

  /// `What are you looking for?`
  String get homeSearchHint {
    return Intl.message(
      'What are you looking for?',
      name: 'homeSearchHint',
      desc: 'Hint text for the home search bar',
      args: [],
    );
  }

  /// `Hotels`
  String get homeCategoryHotels {
    return Intl.message(
      'Hotels',
      name: 'homeCategoryHotels',
      desc: 'Display label for the Hotels quick-access category',
      args: [],
    );
  }

  /// `Cafe`
  String get homeCategoryCafe {
    return Intl.message(
      'Cafe',
      name: 'homeCategoryCafe',
      desc: 'Display label for the Cafe quick-access category',
      args: [],
    );
  }

  /// `Restaurant`
  String get homeCategoryRestaurant {
    return Intl.message(
      'Restaurant',
      name: 'homeCategoryRestaurant',
      desc: 'Display label for the Restaurant quick-access category',
      args: [],
    );
  }

  /// `More`
  String get homeCategoryMore {
    return Intl.message(
      'More',
      name: 'homeCategoryMore',
      desc: 'Display label for the More category tile that opens the full grid',
      args: [],
    );
  }

  /// `Car Rental`
  String get homeCategoryCarRental {
    return Intl.message(
      'Car Rental',
      name: 'homeCategoryCarRental',
      desc: 'Display label for the Car Rental category',
      args: [],
    );
  }

  /// `Laboratory`
  String get homeCategoryLaboratory {
    return Intl.message(
      'Laboratory',
      name: 'homeCategoryLaboratory',
      desc: 'Display label for the Laboratory category',
      args: [],
    );
  }

  /// `Flight`
  String get homeCategoryFlight {
    return Intl.message(
      'Flight',
      name: 'homeCategoryFlight',
      desc: 'Display label for the Flight category',
      args: [],
    );
  }

  /// `Book Table`
  String get restaurantBookTableTitle {
    return Intl.message(
      'Book Table',
      name: 'restaurantBookTableTitle',
      desc: 'App bar title for the book-table step of the restaurant booking wizard',
      args: [],
    );
  }

  /// `Select Reservation Time`
  String get restaurantSelectReservationTimeTitle {
    return Intl.message(
      'Select Reservation Time',
      name: 'restaurantSelectReservationTimeTitle',
      desc: 'Section title on the book-table step',
      args: [],
    );
  }

  /// `From 1 hr, up to 14 days in advance`
  String get restaurantReservationTimeHint {
    return Intl.message(
      'From 1 hr, up to 14 days in advance',
      name: 'restaurantReservationTimeHint',
      desc: 'Instructional copy under the reservation time section title',
      args: [],
    );
  }

  /// `Date`
  String get restaurantDateLabel {
    return Intl.message(
      'Date',
      name: 'restaurantDateLabel',
      desc: 'Label for the reservation date row',
      args: [],
    );
  }

  /// `Select date`
  String get restaurantSelectDatePlaceholder {
    return Intl.message(
      'Select date',
      name: 'restaurantSelectDatePlaceholder',
      desc: 'Placeholder value shown before a reservation date is picked',
      args: [],
    );
  }

  /// `Time`
  String get restaurantTimeLabel {
    return Intl.message(
      'Time',
      name: 'restaurantTimeLabel',
      desc: 'Label for the reservation time row',
      args: [],
    );
  }

  /// `Select time`
  String get restaurantSelectTimePlaceholder {
    return Intl.message(
      'Select time',
      name: 'restaurantSelectTimePlaceholder',
      desc: 'Placeholder value shown before a reservation time is picked',
      args: [],
    );
  }

  /// `Continue`
  String get restaurantContinueLabel {
    return Intl.message(
      'Continue',
      name: 'restaurantContinueLabel',
      desc: 'Continue button label used across the restaurant booking wizard steps',
      args: [],
    );
  }

  /// `All`
  String get restaurantFilterAll {
    return Intl.message(
      'All',
      name: 'restaurantFilterAll',
      desc: 'Cuisine filter chip: show all',
      args: [],
    );
  }

  /// `Burger`
  String get restaurantFilterBurger {
    return Intl.message(
      'Burger',
      name: 'restaurantFilterBurger',
      desc: 'Cuisine filter chip: burger',
      args: [],
    );
  }

  /// `Pizza`
  String get restaurantFilterPizza {
    return Intl.message(
      'Pizza',
      name: 'restaurantFilterPizza',
      desc: 'Cuisine filter chip: pizza',
      args: [],
    );
  }

  /// `Booking Restaurant`
  String get restaurantBookingHeaderTitle {
    return Intl.message(
      'Booking Restaurant',
      name: 'restaurantBookingHeaderTitle',
      desc: 'Title of the restaurant listing screen\'s hero header',
      args: [],
    );
  }

  /// `Top Rated Places ⭐`
  String get restaurantTopRatedTitle {
    return Intl.message(
      'Top Rated Places ⭐',
      name: 'restaurantTopRatedTitle',
      desc:
          'Section title for top rated places on the restaurant listing screen',
      args: [],
    );
  }

  /// `Coming Soon`
  String get restaurantComingSoonTitle {
    return Intl.message(
      'Coming Soon',
      name: 'restaurantComingSoonTitle',
      desc: 'Section title for the coming-soon section on the restaurant listing screen',
      args: [],
    );
  }

  /// `Menu`
  String get restaurantMenuTitle {
    return Intl.message(
      'Menu',
      name: 'restaurantMenuTitle',
      desc: 'App bar title for the restaurant menu photo screen',
      args: [],
    );
  }

  /// `Booking summary`
  String get restaurantBookingSummaryTitle {
    return Intl.message(
      'Booking summary',
      name: 'restaurantBookingSummaryTitle',
      desc: 'App bar title for the booking summary step',
      args: [],
    );
  }

  /// `Add Promo Code`
  String get restaurantAddPromoCodeTitle {
    return Intl.message(
      'Add Promo Code',
      name: 'restaurantAddPromoCodeTitle',
      desc: 'Section title for the promo code field on booking summary',
      args: [],
    );
  }

  /// `Use Promo Code to get more discount`
  String get restaurantPromoCodeSubtitle {
    return Intl.message(
      'Use Promo Code to get more discount',
      name: 'restaurantPromoCodeSubtitle',
      desc: 'Subtitle under the Add Promo Code section title',
      args: [],
    );
  }

  /// `Select Payment Method`
  String get restaurantSelectPaymentMethodTitle {
    return Intl.message(
      'Select Payment Method',
      name: 'restaurantSelectPaymentMethodTitle',
      desc: 'Section title for the payment method list',
      args: [],
    );
  }

  /// `Add a new card`
  String get restaurantAddNewCardLabel {
    return Intl.message(
      'Add a new card',
      name: 'restaurantAddNewCardLabel',
      desc: 'Payment method tile label to add a new card',
      args: [],
    );
  }

  /// `Payment summary`
  String get restaurantPaymentSummaryTitle {
    return Intl.message(
      'Payment summary',
      name: 'restaurantPaymentSummaryTitle',
      desc: 'Section title for the payment summary breakdown',
      args: [],
    );
  }

  /// `Confirm & pay`
  String get restaurantConfirmAndPayLabel {
    return Intl.message(
      'Confirm & pay',
      name: 'restaurantConfirmAndPayLabel',
      desc: 'Bottom bar CTA on the booking summary step',
      args: [],
    );
  }

  /// `We hold your reservation for`
  String get restaurantHoldReservationMessage {
    return Intl.message(
      'We hold your reservation for',
      name: 'restaurantHoldReservationMessage',
      desc: 'Prefix of the hold-countdown banner text, followed by a live mm:ss timer',
      args: [],
    );
  }

  /// `Person`
  String get restaurantPersonLabel {
    return Intl.message(
      'Person',
      name: 'restaurantPersonLabel',
      desc: 'Field label for the party size row in the booking summary card',
      args: [],
    );
  }

  /// `{count} Person`
  String restaurantPartySizeValue(String count) {
    return Intl.message(
      '$count Person',
      name: 'restaurantPartySizeValue',
      desc: 'Value showing how many guests are in the party',
      args: [count],
    );
  }

  /// `Option`
  String get restaurantOptionLabel {
    return Intl.message(
      'Option',
      name: 'restaurantOptionLabel',
      desc:
          'Field label for the seating option row in the booking summary card',
      args: [],
    );
  }

  /// `Note`
  String get restaurantNoteLabel {
    return Intl.message(
      'Note',
      name: 'restaurantNoteLabel',
      desc: 'Field label for the note row in the booking summary card',
      args: [],
    );
  }

  /// `Remaining money`
  String get restaurantRemainingMoneyLabel {
    return Intl.message(
      'Remaining money',
      name: 'restaurantRemainingMoneyLabel',
      desc: 'Field label for the remaining balance row in the booking summary card',
      args: [],
    );
  }

  /// `Add a note`
  String get restaurantAddNoteText {
    return Intl.message(
      'Add a note',
      name: 'restaurantAddNoteText',
      desc: 'Placeholder value shown when no note has been entered yet',
      args: [],
    );
  }

  /// `Enter promo code`
  String get restaurantPromoCodeHint {
    return Intl.message(
      'Enter promo code',
      name: 'restaurantPromoCodeHint',
      desc: 'Hint text for the promo code text field',
      args: [],
    );
  }

  /// `Apply`
  String get restaurantApplyLabel {
    return Intl.message(
      'Apply',
      name: 'restaurantApplyLabel',
      desc: 'Button label to apply a promo code',
      args: [],
    );
  }

  /// `Promo code applied`
  String get restaurantPromoCodeAppliedMessage {
    return Intl.message(
      'Promo code applied',
      name: 'restaurantPromoCodeAppliedMessage',
      desc: 'Snackbar shown after applying a promo code',
      args: [],
    );
  }

  /// `How many people?`
  String get restaurantHowManyPeopleTitle {
    return Intl.message(
      'How many people?',
      name: 'restaurantHowManyPeopleTitle',
      desc: 'Section title on the party details step',
      args: [],
    );
  }

  /// `Select Option`
  String get restaurantSelectOptionTitle {
    return Intl.message(
      'Select Option',
      name: 'restaurantSelectOptionTitle',
      desc: 'Section title for the seating option picker on the party details step',
      args: [],
    );
  }

  /// `Add Note`
  String get restaurantAddNoteTitle {
    return Intl.message(
      'Add Note',
      name: 'restaurantAddNoteTitle',
      desc: 'Section title for the note field on the party details step',
      args: [],
    );
  }

  /// `Ex: I want to do a birthday party`
  String get restaurantNoteHint {
    return Intl.message(
      'Ex: I want to do a birthday party',
      name: 'restaurantNoteHint',
      desc: 'Hint text for the optional booking note field',
      args: [],
    );
  }

  /// `About`
  String get venueAboutTitle {
    return Intl.message(
      'About',
      name: 'venueAboutTitle',
      desc: 'Section heading for the venue\'s About tab/section',
      args: [],
    );
  }

  /// `See more`
  String get venueAboutSeeMore {
    return Intl.message(
      'See more',
      name: 'venueAboutSeeMore',
      desc: 'Expand action under the About section description',
      args: [],
    );
  }

  /// `Menu`
  String get venueMenuLabel {
    return Intl.message(
      'Menu',
      name: 'venueMenuLabel',
      desc: 'Label under the circular shortcut button that opens the venue\'s menu',
      args: [],
    );
  }

  /// `Book Table`
  String get venueBookTableButton {
    return Intl.message(
      'Book Table',
      name: 'venueBookTableButton',
      desc: 'Default CTA label on the venue detail screen\'s bottom bar',
      args: [],
    );
  }

  /// `Booking Confirmed`
  String get venueBookingConfirmedTitle {
    return Intl.message(
      'Booking Confirmed',
      name: 'venueBookingConfirmedTitle',
      desc: 'Default headline on the booking-confirmed screen',
      args: [],
    );
  }

  /// `your Table has been reserved with successfully`
  String get venueBookingConfirmedMessage {
    return Intl.message(
      'your Table has been reserved with successfully',
      name: 'venueBookingConfirmedMessage',
      desc: 'Default confirmation message on the booking-confirmed screen',
      args: [],
    );
  }

  /// `Payment summary`
  String get venuePaymentSummaryTitle {
    return Intl.message(
      'Payment summary',
      name: 'venuePaymentSummaryTitle',
      desc: 'Heading above the payment summary rows on the booking-confirmed screen',
      args: [],
    );
  }

  /// `View Booking Details`
  String get venueViewBookingDetailsButton {
    return Intl.message(
      'View Booking Details',
      name: 'venueViewBookingDetailsButton',
      desc: 'Button on the booking-confirmed screen that opens the booking details',
      args: [],
    );
  }

  /// `Back to home`
  String get venueBackToHomeButton {
    return Intl.message(
      'Back to home',
      name: 'venueBackToHomeButton',
      desc: 'Button on the booking-confirmed screen that returns to the home screen',
      args: [],
    );
  }

  /// `Booking ID`
  String get venueBookingIdLabel {
    return Intl.message(
      'Booking ID',
      name: 'venueBookingIdLabel',
      desc: 'Row label for the booking reference on the booking-confirmed details card',
      args: [],
    );
  }

  /// `Date`
  String get venueDateLabel {
    return Intl.message(
      'Date',
      name: 'venueDateLabel',
      desc: 'Row label for the booking date on the booking-confirmed details card',
      args: [],
    );
  }

  /// `Payment method`
  String get venuePaymentMethodLabel {
    return Intl.message(
      'Payment method',
      name: 'venuePaymentMethodLabel',
      desc: 'Row label for the payment method on the booking-confirmed details card',
      args: [],
    );
  }

  /// `Apple pay`
  String get venuePaymentMethodApplePay {
    return Intl.message(
      'Apple pay',
      name: 'venuePaymentMethodApplePay',
      desc: 'Display text for the Apple Pay payment method',
      args: [],
    );
  }

  /// `New card`
  String get venuePaymentMethodNewCard {
    return Intl.message(
      'New card',
      name: 'venuePaymentMethodNewCard',
      desc: 'Display text for the new-card payment method',
      args: [],
    );
  }

  /// `Facilities`
  String get venueFacilitiesTitle {
    return Intl.message(
      'Facilities',
      name: 'venueFacilitiesTitle',
      desc: 'Section heading for the venue\'s Facilities tab/section',
      args: [],
    );
  }

  /// `See More`
  String get venueFacilitiesSeeMore {
    return Intl.message(
      'See More',
      name: 'venueFacilitiesSeeMore',
      desc: 'Expand action under the Facilities section list',
      args: [],
    );
  }

  /// `Location`
  String get venueLocationTitle {
    return Intl.message(
      'Location',
      name: 'venueLocationTitle',
      desc: 'Section heading for the venue\'s Location tab/section',
      args: [],
    );
  }

  /// `See Location on map`
  String get venueSeeLocationOnMapButton {
    return Intl.message(
      'See Location on map',
      name: 'venueSeeLocationOnMapButton',
      desc: 'Button over the map preview in the Location section',
      args: [],
    );
  }

  /// `From Your location`
  String get venueFromYourLocationLabel {
    return Intl.message(
      'From Your location',
      name: 'venueFromYourLocationLabel',
      desc: 'Label preceding the distance-from-user value in the Location section',
      args: [],
    );
  }

  /// `Sub total`
  String get venueSubTotalLabel {
    return Intl.message(
      'Sub total',
      name: 'venueSubTotalLabel',
      desc: 'Row label for the subtotal amount in the venue payment summary',
      args: [],
    );
  }

  /// `fees`
  String get venueFeesLabel {
    return Intl.message(
      'fees',
      name: 'venueFeesLabel',
      desc: 'Row label for the fees amount in the venue payment summary',
      args: [],
    );
  }

  /// `Total amount`
  String get venueTotalAmountLabel {
    return Intl.message(
      'Total amount',
      name: 'venueTotalAmountLabel',
      desc: 'Row label for the total amount in the venue payment summary',
      args: [],
    );
  }

  /// `Policy`
  String get venuePolicyTitle {
    return Intl.message(
      'Policy',
      name: 'venuePolicyTitle',
      desc: 'Section heading for the venue\'s Policy tab/section',
      args: [],
    );
  }

  /// `Deposite Need : `
  String get venueDepositNeedLabel {
    return Intl.message(
      'Deposite Need : ',
      name: 'venueDepositNeedLabel',
      desc: 'Label prefix before the deposit amount in the Policy section',
      args: [],
    );
  }

  /// `/Person`
  String get venuePerPersonSuffix {
    return Intl.message(
      '/Person',
      name: 'venuePerPersonSuffix',
      desc: 'Unit suffix appended after a per-person price or deposit amount',
      args: [],
    );
  }

  /// `Opening at`
  String get venueOpeningAtLabel {
    return Intl.message(
      'Opening at',
      name: 'venueOpeningAtLabel',
      desc: 'Label for the opening-hours row in the Policy section',
      args: [],
    );
  }

  /// `Closed at`
  String get venueClosedAtLabel {
    return Intl.message(
      'Closed at',
      name: 'venueClosedAtLabel',
      desc: 'Label for the closing-hours row in the Policy section',
      args: [],
    );
  }

  /// `Call {phone}`
  String venueCallPhoneLabel(String phone) {
    return Intl.message(
      'Call $phone',
      name: 'venueCallPhoneLabel',
      desc: 'Call-to-action text with the venue\'s phone number in the Policy section',
      args: [phone],
    );
  }

  /// `Price : {price}`
  String venuePriceLabel(String price) {
    return Intl.message(
      'Price : $price',
      name: 'venuePriceLabel',
      desc: 'Price label shown on the hero image\'s price pill',
      args: [price],
    );
  }

  /// `Next`
  String get venueNextButton {
    return Intl.message(
      'Next',
      name: 'venueNextButton',
      desc: 'Confirm button on the reservation calendar/time picker sheet',
      args: [],
    );
  }

  /// `Time`
  String get venueTimeLabel {
    return Intl.message(
      'Time',
      name: 'venueTimeLabel',
      desc: 'Heading for the time-picker row on the reservation calendar sheet',
      args: [],
    );
  }

  /// `AM`
  String get venueAmLabel {
    return Intl.message(
      'AM',
      name: 'venueAmLabel',
      desc: 'AM segment label on the reservation calendar sheet\'s meridiem toggle',
      args: [],
    );
  }

  /// `PM`
  String get venuePmLabel {
    return Intl.message(
      'PM',
      name: 'venuePmLabel',
      desc: 'PM segment label on the reservation calendar sheet\'s meridiem toggle',
      args: [],
    );
  }

  /// `SUN`
  String get venueCalendarSun {
    return Intl.message(
      'SUN',
      name: 'venueCalendarSun',
      desc: 'Sunday column header on the reservation calendar sheet',
      args: [],
    );
  }

  /// `MON`
  String get venueCalendarMon {
    return Intl.message(
      'MON',
      name: 'venueCalendarMon',
      desc: 'Monday column header on the reservation calendar sheet',
      args: [],
    );
  }

  /// `TUE`
  String get venueCalendarTue {
    return Intl.message(
      'TUE',
      name: 'venueCalendarTue',
      desc: 'Tuesday column header on the reservation calendar sheet',
      args: [],
    );
  }

  /// `WED`
  String get venueCalendarWed {
    return Intl.message(
      'WED',
      name: 'venueCalendarWed',
      desc: 'Wednesday column header on the reservation calendar sheet',
      args: [],
    );
  }

  /// `THU`
  String get venueCalendarThu {
    return Intl.message(
      'THU',
      name: 'venueCalendarThu',
      desc: 'Thursday column header on the reservation calendar sheet',
      args: [],
    );
  }

  /// `FRI`
  String get venueCalendarFri {
    return Intl.message(
      'FRI',
      name: 'venueCalendarFri',
      desc: 'Friday column header on the reservation calendar sheet',
      args: [],
    );
  }

  /// `SAT`
  String get venueCalendarSat {
    return Intl.message(
      'SAT',
      name: 'venueCalendarSat',
      desc: 'Saturday column header on the reservation calendar sheet',
      args: [],
    );
  }

  /// `Review `
  String get venueReviewLabel {
    return Intl.message(
      'Review ',
      name: 'venueReviewLabel',
      desc: 'Label preceding the review count in the Reviews section heading',
      args: [],
    );
  }

  /// `Filters coming soon`
  String get venueFiltersComingSoonMessage {
    return Intl.message(
      'Filters coming soon',
      name: 'venueFiltersComingSoonMessage',
      desc: 'Snackbar shown when tapping the (not-yet-implemented) filters icon on the venue filter row',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
