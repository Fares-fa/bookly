// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(phoneNumber) =>
      "تم إرسال رمز مكوّن من 4 أرقام إلى ${phoneNumber}.";

  static String m1(time) => "إعادة إرسال الرمز خلال ${time}";

  static String m2(count) => "${count} شخص";

  static String m3(category, distance) => "${category} • ${distance} كم";

  static String m4(count) => "${count} مقعد متبقٍ";

  static String m5(count) => "${count} تقييم";

  static String m6(label) => "${label} قريباً";

  static String m7(count) => "${count} شخص";

  static String m8(phone) => "اتصل بـ ${phone}";

  static String m9(price) => "السعر : ${price}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appName": MessageLookupByLibrary.simpleMessage("بوكلي"),
    "authAlreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "لديك حساب بالفعل؟ ",
    ),
    "authBackToLogin": MessageLookupByLibrary.simpleMessage(
      "العودة إلى تسجيل الدخول",
    ),
    "authConfirmPasswordLabel": MessageLookupByLibrary.simpleMessage(
      "تأكيد كلمة المرور",
    ),
    "authConfirmPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "تأكيد كلمة المرور مطلوب",
    ),
    "authContinueButton": MessageLookupByLibrary.simpleMessage("متابعة"),
    "authCreateAccountSubtitle": MessageLookupByLibrary.simpleMessage(
      "انضم إلينا وابدأ رحلتك",
    ),
    "authCreateAccountTitle": MessageLookupByLibrary.simpleMessage(
      "إنشاء حساب",
    ),
    "authEmailInvalid": MessageLookupByLibrary.simpleMessage(
      "أدخل بريدًا إلكترونيًا صحيحًا",
    ),
    "authEmailLabel": MessageLookupByLibrary.simpleMessage("البريد الإلكتروني"),
    "authEmailRequired": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني مطلوب",
    ),
    "authEnterPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "أدخل رقم هاتفك",
    ),
    "authFullNameLabel": MessageLookupByLibrary.simpleMessage("الاسم الكامل"),
    "authInvalidPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال رقم هاتف صحيح",
    ),
    "authJoinAsGuest": MessageLookupByLibrary.simpleMessage("المتابعة كضيف"),
    "authLogIn": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
    "authMobileNumberHint": MessageLookupByLibrary.simpleMessage("رقم الجوال"),
    "authNameRequired": MessageLookupByLibrary.simpleMessage("الاسم مطلوب"),
    "authOtpNotice": MessageLookupByLibrary.simpleMessage(
      "سيتم إرسال رمز تحقق إلى رقم هاتفك للتحقق منه.",
    ),
    "authOtpSentGeneric": MessageLookupByLibrary.simpleMessage(
      "أدخل الرمز المكوّن من 4 أرقام المُرسل إلى هاتفك.",
    ),
    "authOtpSentToPhone": m0,
    "authOtpTitle": MessageLookupByLibrary.simpleMessage("أدخل رمز التحقق"),
    "authPasswordLabel": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
    "authPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور مطلوبة",
    ),
    "authPasswordResetSuccess": MessageLookupByLibrary.simpleMessage(
      "تم إرسال رابط إعادة تعيين كلمة المرور بنجاح",
    ),
    "authPasswordTooShort": MessageLookupByLibrary.simpleMessage(
      "يجب ألا تقل كلمة المرور عن 6 أحرف",
    ),
    "authPasswordsMismatch": MessageLookupByLibrary.simpleMessage(
      "كلمتا المرور غير متطابقتين",
    ),
    "authResendCode": MessageLookupByLibrary.simpleMessage("إعادة إرسال الرمز"),
    "authResendCodeIn": m1,
    "authResetPasswordSubtitle": MessageLookupByLibrary.simpleMessage(
      "أدخل بريدك الإلكتروني لتلقي رابط إعادة التعيين",
    ),
    "authResetPasswordTitle": MessageLookupByLibrary.simpleMessage(
      "إعادة تعيين كلمة المرور",
    ),
    "authSendResetLinkButton": MessageLookupByLibrary.simpleMessage(
      "إرسال رابط إعادة التعيين",
    ),
    "authSignUpButton": MessageLookupByLibrary.simpleMessage("إنشاء حساب"),
    "authVerifyButton": MessageLookupByLibrary.simpleMessage("تحقق"),
    "bookingCategoryCafe": MessageLookupByLibrary.simpleMessage("مقاهي"),
    "bookingCategoryHotels": MessageLookupByLibrary.simpleMessage("فنادق"),
    "bookingCategoryRestaurant": MessageLookupByLibrary.simpleMessage("مطاعم"),
    "bookingCheckInLabel": MessageLookupByLibrary.simpleMessage("تسجيل الوصول"),
    "bookingCheckOutLabel": MessageLookupByLibrary.simpleMessage(
      "تسجيل المغادرة",
    ),
    "bookingDetailsTitle": MessageLookupByLibrary.simpleMessage("تفاصيل الحجز"),
    "bookingFeesLabel": MessageLookupByLibrary.simpleMessage("الرسوم"),
    "bookingMyBookingSubtitle": MessageLookupByLibrary.simpleMessage(
      "اطّلع على جميع حجوزاتك وأدرها",
    ),
    "bookingMyBookingTitle": MessageLookupByLibrary.simpleMessage("حجوزاتي"),
    "bookingNoBookingsYetSubtitle": MessageLookupByLibrary.simpleMessage(
      "ستظهر حجوزاتك القادمة والسابقة هنا.",
    ),
    "bookingNoBookingsYetTitle": MessageLookupByLibrary.simpleMessage(
      "لا توجد حجوزات بعد",
    ),
    "bookingPaymentSummaryTitle": MessageLookupByLibrary.simpleMessage(
      "ملخص الدفع",
    ),
    "bookingStatusAll": MessageLookupByLibrary.simpleMessage("الكل"),
    "bookingStatusCancelled": MessageLookupByLibrary.simpleMessage("ملغاة"),
    "bookingStatusCompleted": MessageLookupByLibrary.simpleMessage("مكتملة"),
    "bookingStatusUpcoming": MessageLookupByLibrary.simpleMessage("القادمة"),
    "bookingSubtotalLabel": MessageLookupByLibrary.simpleMessage(
      "المجموع الفرعي",
    ),
    "bookingTotalAmountLabel": MessageLookupByLibrary.simpleMessage(
      "المبلغ الإجمالي",
    ),
    "bookingTotalStayLabel": MessageLookupByLibrary.simpleMessage(
      "إجمالي مدة الإقامة",
    ),
    "cafeAddNewCardLabel": MessageLookupByLibrary.simpleMessage(
      "إضافة بطاقة جديدة",
    ),
    "cafeAddNotePlaceholder": MessageLookupByLibrary.simpleMessage(
      "أضف ملاحظة",
    ),
    "cafeAddNoteTitle": MessageLookupByLibrary.simpleMessage("أضف ملاحظة"),
    "cafeAddPromoCodeTitle": MessageLookupByLibrary.simpleMessage(
      "إضافة كود خصم",
    ),
    "cafeApplyButton": MessageLookupByLibrary.simpleMessage("تطبيق"),
    "cafeBookTableTitle": MessageLookupByLibrary.simpleMessage("حجز طاولة"),
    "cafeBookingHeaderTitle": MessageLookupByLibrary.simpleMessage("حجز مقهى"),
    "cafeBookingSummaryTitle": MessageLookupByLibrary.simpleMessage(
      "ملخص الحجز",
    ),
    "cafeComingSoonTitle": MessageLookupByLibrary.simpleMessage("قريبًا"),
    "cafeConfirmAndPayButton": MessageLookupByLibrary.simpleMessage(
      "تأكيد والدفع",
    ),
    "cafeContinueButton": MessageLookupByLibrary.simpleMessage("متابعة"),
    "cafeDateLabel": MessageLookupByLibrary.simpleMessage("التاريخ"),
    "cafeEnterPromoCodeHint": MessageLookupByLibrary.simpleMessage(
      "أدخل كود الخصم",
    ),
    "cafeFilterAll": MessageLookupByLibrary.simpleMessage("الكل"),
    "cafeFilterCoffee": MessageLookupByLibrary.simpleMessage("قهوة"),
    "cafeFilterDessert": MessageLookupByLibrary.simpleMessage("حلويات"),
    "cafeHoldReservationText": MessageLookupByLibrary.simpleMessage(
      "نحتفظ بحجزك لمدة ",
    ),
    "cafeHowManyPeopleTitle": MessageLookupByLibrary.simpleMessage(
      "كم عدد الأشخاص؟",
    ),
    "cafeMenuTitle": MessageLookupByLibrary.simpleMessage("القائمة"),
    "cafeNoteHint": MessageLookupByLibrary.simpleMessage(
      "مثال: أرغب في تنظيم حفلة عيد ميلاد",
    ),
    "cafeNoteLabel": MessageLookupByLibrary.simpleMessage("ملاحظة"),
    "cafeOptionLabel": MessageLookupByLibrary.simpleMessage("الخيار"),
    "cafePaymentSummaryTitle": MessageLookupByLibrary.simpleMessage(
      "ملخص الدفع",
    ),
    "cafePersonCount": m2,
    "cafePersonLabel": MessageLookupByLibrary.simpleMessage("عدد الأشخاص"),
    "cafePromoCodeAppliedMessage": MessageLookupByLibrary.simpleMessage(
      "تم تطبيق كود الخصم",
    ),
    "cafePromoCodeHint": MessageLookupByLibrary.simpleMessage(
      "استخدم كود الخصم للحصول على خصم أكبر",
    ),
    "cafeRemainingMoneyLabel": MessageLookupByLibrary.simpleMessage(
      "المبلغ المتبقي",
    ),
    "cafeReservationTimeHint": MessageLookupByLibrary.simpleMessage(
      "من ساعة واحدة وحتى 14 يومًا مقدمًا",
    ),
    "cafeSelectDatePlaceholder": MessageLookupByLibrary.simpleMessage(
      "اختر التاريخ",
    ),
    "cafeSelectOptionTitle": MessageLookupByLibrary.simpleMessage(
      "اختر الخيار",
    ),
    "cafeSelectPaymentMethodTitle": MessageLookupByLibrary.simpleMessage(
      "اختر طريقة الدفع",
    ),
    "cafeSelectReservationTimeTitle": MessageLookupByLibrary.simpleMessage(
      "اختر وقت الحجز",
    ),
    "cafeSelectTimePlaceholder": MessageLookupByLibrary.simpleMessage(
      "اختر الوقت",
    ),
    "cafeTimeLabel": MessageLookupByLibrary.simpleMessage("الوقت"),
    "cafeTopRatedTitle": MessageLookupByLibrary.simpleMessage(
      "الأماكن الأعلى تقييمًا ⭐",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "commonErrorTitle": MessageLookupByLibrary.simpleMessage("حدث خطأ ما"),
    "commonExtraAllFilterLabel": MessageLookupByLibrary.simpleMessage("الكل"),
    "commonExtraBookYourSeatsLabel": MessageLookupByLibrary.simpleMessage(
      "احجز مقاعدك",
    ),
    "commonExtraCategoryDistanceKm": m3,
    "commonExtraClosedLabel": MessageLookupByLibrary.simpleMessage("مغلق"),
    "commonExtraComingSoonTitle": MessageLookupByLibrary.simpleMessage(
      "قريباً",
    ),
    "commonExtraCouldNotLoadNearbyPlaces": MessageLookupByLibrary.simpleMessage(
      "تعذر تحميل الأماكن القريبة",
    ),
    "commonExtraEgpCurrencyPrefix": MessageLookupByLibrary.simpleMessage(
      "جنيه مصري ",
    ),
    "commonExtraFiltersComingSoonMessage": MessageLookupByLibrary.simpleMessage(
      "الفلاتر قريباً",
    ),
    "commonExtraNearbyPlacesTitle": MessageLookupByLibrary.simpleMessage(
      "أماكن قريبة",
    ),
    "commonExtraNoNearbyPlacesFound": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على أماكن قريبة",
    ),
    "commonExtraSeatsLeftLabel": m4,
    "commonExtraTopRatedPlacesTitle": MessageLookupByLibrary.simpleMessage(
      "الأماكن الأعلى تقييماً",
    ),
    "commonNavFavorite": MessageLookupByLibrary.simpleMessage("المفضلة"),
    "commonNavHome": MessageLookupByLibrary.simpleMessage("الرئيسية"),
    "commonNavMore": MessageLookupByLibrary.simpleMessage("المزيد"),
    "commonNavMyBooking": MessageLookupByLibrary.simpleMessage("حجوزاتي"),
    "commonRetryButton": MessageLookupByLibrary.simpleMessage("حاول مرة أخرى"),
    "completeInfoContinueButton": MessageLookupByLibrary.simpleMessage(
      "متابعة",
    ),
    "completeInfoDobRequired": MessageLookupByLibrary.simpleMessage(
      "يرجى تحديد تاريخ ميلادك",
    ),
    "completeInfoFullNameHint": MessageLookupByLibrary.simpleMessage(
      "أدخل اسمك الكامل",
    ),
    "completeInfoFullNameRequired": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال اسمك الكامل",
    ),
    "completeInfoGenderFemale": MessageLookupByLibrary.simpleMessage("أنثى"),
    "completeInfoGenderLabel": MessageLookupByLibrary.simpleMessage("الجنس"),
    "completeInfoGenderMale": MessageLookupByLibrary.simpleMessage("ذكر"),
    "completeInfoGenderRequired": MessageLookupByLibrary.simpleMessage(
      "يرجى تحديد جنسك",
    ),
    "completeInfoInterestBars": MessageLookupByLibrary.simpleMessage("بارات"),
    "completeInfoInterestCafes": MessageLookupByLibrary.simpleMessage("مقاهي"),
    "completeInfoInterestFood": MessageLookupByLibrary.simpleMessage("طعام"),
    "completeInfoInterestHotels": MessageLookupByLibrary.simpleMessage("فنادق"),
    "completeInfoInterestLabTest": MessageLookupByLibrary.simpleMessage(
      "تحاليل مخبرية",
    ),
    "completeInfoInterestShopping": MessageLookupByLibrary.simpleMessage(
      "تسوق",
    ),
    "completeInfoInterestSpaWellness": MessageLookupByLibrary.simpleMessage(
      "سبا وعافية",
    ),
    "completeInfoInterestsSubtitle": MessageLookupByLibrary.simpleMessage(
      "حدد بدقة الأشياء التي تحبها",
    ),
    "completeInfoInterestsTitle": MessageLookupByLibrary.simpleMessage(
      "اختر اهتماماتك",
    ),
    "completeInfoSelectDob": MessageLookupByLibrary.simpleMessage(
      "حدد تاريخ ميلادك",
    ),
    "completeInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "أضف اسمك وتفاصيلك لتخصيص تجربتك",
    ),
    "completeInfoTitle": MessageLookupByLibrary.simpleMessage("أكمل معلوماتك"),
    "favoritesCafesCategoryTitle": MessageLookupByLibrary.simpleMessage(
      "المقاهي",
    ),
    "favoritesCafesScreenTitle": MessageLookupByLibrary.simpleMessage(
      "المقاهي المفضلة",
    ),
    "favoritesEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "ستظهر هنا الأماكن والعروض التي تضيفها إلى المفضلة.",
    ),
    "favoritesEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "لا توجد عناصر مفضلة بعد",
    ),
    "favoritesHotelsCategoryTitle": MessageLookupByLibrary.simpleMessage(
      "الفنادق",
    ),
    "favoritesHotelsScreenTitle": MessageLookupByLibrary.simpleMessage(
      "الفنادق المفضلة",
    ),
    "favoritesMyFavoriteTitle": MessageLookupByLibrary.simpleMessage("مفضلتي"),
    "favoritesPageTitle": MessageLookupByLibrary.simpleMessage("المفضلة"),
    "favoritesRestaurantCategoryTitle": MessageLookupByLibrary.simpleMessage(
      "المطاعم",
    ),
    "favoritesRestaurantsScreenTitle": MessageLookupByLibrary.simpleMessage(
      "المطعم المفضل",
    ),
    "favoritesReviewCount": m5,
    "helloWorld": MessageLookupByLibrary.simpleMessage("مرحباً بالعالم"),
    "homeAdsLoadError": MessageLookupByLibrary.simpleMessage(
      "تعذر تحميل الإعلانات",
    ),
    "homeCategoriesTitle": MessageLookupByLibrary.simpleMessage("الفئات"),
    "homeCategoryCafe": MessageLookupByLibrary.simpleMessage("كافيه"),
    "homeCategoryCarRental": MessageLookupByLibrary.simpleMessage(
      "تأجير السيارات",
    ),
    "homeCategoryComingSoonBadge": MessageLookupByLibrary.simpleMessage(
      "قريباً",
    ),
    "homeCategoryComingSoonMessage": m6,
    "homeCategoryFlight": MessageLookupByLibrary.simpleMessage("الطيران"),
    "homeCategoryHotels": MessageLookupByLibrary.simpleMessage("فنادق"),
    "homeCategoryLaboratory": MessageLookupByLibrary.simpleMessage("المختبر"),
    "homeCategoryMore": MessageLookupByLibrary.simpleMessage("المزيد"),
    "homeCategoryRestaurant": MessageLookupByLibrary.simpleMessage("مطعم"),
    "homeNoNotificationsMessage": MessageLookupByLibrary.simpleMessage(
      "لا توجد إشعارات جديدة",
    ),
    "homeSearchHint": MessageLookupByLibrary.simpleMessage("عمّا تبحث؟"),
    "moreAccount": MessageLookupByLibrary.simpleMessage("الحساب"),
    "moreGreeting": MessageLookupByLibrary.simpleMessage("مرحبًا"),
    "moreGuestFallbackName": MessageLookupByLibrary.simpleMessage("ضيف"),
    "moreInviteFriend": MessageLookupByLibrary.simpleMessage("دعوة صديق"),
    "moreLanguageTitle": MessageLookupByLibrary.simpleMessage("اللغة"),
    "moreLogout": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
    "moreLogoutConfirm": MessageLookupByLibrary.simpleMessage(
      "نعم، تسجيل الخروج",
    ),
    "moreLogoutConfirmMessage": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد من أنك تريد تسجيل الخروج؟",
    ),
    "moreNoNewNotifications": MessageLookupByLibrary.simpleMessage(
      "لا توجد إشعارات جديدة",
    ),
    "morePromoCodes": MessageLookupByLibrary.simpleMessage("أكواد الخصم"),
    "moreSettings": MessageLookupByLibrary.simpleMessage("الإعدادات"),
    "moreSupport": MessageLookupByLibrary.simpleMessage("الدعم"),
    "moreUseDeviceLanguage": MessageLookupByLibrary.simpleMessage(
      "استخدام لغة الجهاز",
    ),
    "notificationsEmptyMessage": MessageLookupByLibrary.simpleMessage(
      "سنُعلمك عندما يكون هناك جديد يستحق إطلاعك عليه.",
    ),
    "notificationsEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "لا توجد إشعارات",
    ),
    "notificationsTitle": MessageLookupByLibrary.simpleMessage("الإشعارات"),
    "ok": MessageLookupByLibrary.simpleMessage("موافق"),
    "onboardingGetStarted": MessageLookupByLibrary.simpleMessage("ابدأ الآن"),
    "onboardingJoinAsGuest": MessageLookupByLibrary.simpleMessage(
      "الدخول كضيف",
    ),
    "onboardingPage1TitleLine1": MessageLookupByLibrary.simpleMessage(
      "قارن واختر",
    ),
    "onboardingPage1TitleLine2": MessageLookupByLibrary.simpleMessage("واحجز"),
    "onboardingPage2TitleLine1": MessageLookupByLibrary.simpleMessage(
      "تطبيق واحد",
    ),
    "onboardingPage2TitleLine2": MessageLookupByLibrary.simpleMessage(
      "حجوزات بلا حدود",
    ),
    "onboardingSkip": MessageLookupByLibrary.simpleMessage("تخطي"),
    "restaurantAddNewCardLabel": MessageLookupByLibrary.simpleMessage(
      "إضافة بطاقة جديدة",
    ),
    "restaurantAddNoteText": MessageLookupByLibrary.simpleMessage("أضف ملاحظة"),
    "restaurantAddNoteTitle": MessageLookupByLibrary.simpleMessage(
      "إضافة ملاحظة",
    ),
    "restaurantAddPromoCodeTitle": MessageLookupByLibrary.simpleMessage(
      "إضافة كود خصم",
    ),
    "restaurantApplyLabel": MessageLookupByLibrary.simpleMessage("تطبيق"),
    "restaurantBookTableTitle": MessageLookupByLibrary.simpleMessage(
      "حجز طاولة",
    ),
    "restaurantBookingHeaderTitle": MessageLookupByLibrary.simpleMessage(
      "حجز مطعم",
    ),
    "restaurantBookingSummaryTitle": MessageLookupByLibrary.simpleMessage(
      "ملخص الحجز",
    ),
    "restaurantComingSoonTitle": MessageLookupByLibrary.simpleMessage("قريبًا"),
    "restaurantConfirmAndPayLabel": MessageLookupByLibrary.simpleMessage(
      "تأكيد والدفع",
    ),
    "restaurantContinueLabel": MessageLookupByLibrary.simpleMessage("متابعة"),
    "restaurantDateLabel": MessageLookupByLibrary.simpleMessage("التاريخ"),
    "restaurantFilterAll": MessageLookupByLibrary.simpleMessage("الكل"),
    "restaurantFilterBurger": MessageLookupByLibrary.simpleMessage("برجر"),
    "restaurantFilterPizza": MessageLookupByLibrary.simpleMessage("بيتزا"),
    "restaurantHoldReservationMessage": MessageLookupByLibrary.simpleMessage(
      "نحتفظ بحجزك لمدة",
    ),
    "restaurantHowManyPeopleTitle": MessageLookupByLibrary.simpleMessage(
      "كم عدد الأشخاص؟",
    ),
    "restaurantMenuTitle": MessageLookupByLibrary.simpleMessage("قائمة الطعام"),
    "restaurantNoteHint": MessageLookupByLibrary.simpleMessage(
      "مثال: أرغب في تنظيم حفلة عيد ميلاد",
    ),
    "restaurantNoteLabel": MessageLookupByLibrary.simpleMessage("الملاحظة"),
    "restaurantOptionLabel": MessageLookupByLibrary.simpleMessage("الخيار"),
    "restaurantPartySizeValue": m7,
    "restaurantPaymentSummaryTitle": MessageLookupByLibrary.simpleMessage(
      "ملخص الدفع",
    ),
    "restaurantPersonLabel": MessageLookupByLibrary.simpleMessage(
      "عدد الأشخاص",
    ),
    "restaurantPromoCodeAppliedMessage": MessageLookupByLibrary.simpleMessage(
      "تم تطبيق كود الخصم",
    ),
    "restaurantPromoCodeHint": MessageLookupByLibrary.simpleMessage(
      "أدخل كود الخصم",
    ),
    "restaurantPromoCodeSubtitle": MessageLookupByLibrary.simpleMessage(
      "استخدم كود الخصم للحصول على خصم إضافي",
    ),
    "restaurantRemainingMoneyLabel": MessageLookupByLibrary.simpleMessage(
      "المبلغ المتبقي",
    ),
    "restaurantReservationTimeHint": MessageLookupByLibrary.simpleMessage(
      "من ساعة واحدة وحتى 14 يومًا مقدمًا",
    ),
    "restaurantSelectDatePlaceholder": MessageLookupByLibrary.simpleMessage(
      "اختر التاريخ",
    ),
    "restaurantSelectOptionTitle": MessageLookupByLibrary.simpleMessage(
      "اختر الخيار",
    ),
    "restaurantSelectPaymentMethodTitle": MessageLookupByLibrary.simpleMessage(
      "اختر طريقة الدفع",
    ),
    "restaurantSelectReservationTimeTitle":
        MessageLookupByLibrary.simpleMessage("اختر موعد الحجز"),
    "restaurantSelectTimePlaceholder": MessageLookupByLibrary.simpleMessage(
      "اختر الوقت",
    ),
    "restaurantTimeLabel": MessageLookupByLibrary.simpleMessage("الوقت"),
    "restaurantTopRatedTitle": MessageLookupByLibrary.simpleMessage(
      "الأماكن الأعلى تقييمًا ⭐",
    ),
    "splashSubtitle": MessageLookupByLibrary.simpleMessage(
      "تطبيق واحد لكل حجوزاتك",
    ),
    "venueAboutSeeMore": MessageLookupByLibrary.simpleMessage("عرض المزيد"),
    "venueAboutTitle": MessageLookupByLibrary.simpleMessage("نبذة"),
    "venueAmLabel": MessageLookupByLibrary.simpleMessage("ص"),
    "venueBackToHomeButton": MessageLookupByLibrary.simpleMessage(
      "العودة إلى الرئيسية",
    ),
    "venueBookTableButton": MessageLookupByLibrary.simpleMessage("احجز طاولة"),
    "venueBookingConfirmedMessage": MessageLookupByLibrary.simpleMessage(
      "تم حجز طاولتك بنجاح",
    ),
    "venueBookingConfirmedTitle": MessageLookupByLibrary.simpleMessage(
      "تم تأكيد الحجز",
    ),
    "venueBookingIdLabel": MessageLookupByLibrary.simpleMessage("رقم الحجز"),
    "venueCalendarFri": MessageLookupByLibrary.simpleMessage("الجمعة"),
    "venueCalendarMon": MessageLookupByLibrary.simpleMessage("الإثنين"),
    "venueCalendarSat": MessageLookupByLibrary.simpleMessage("السبت"),
    "venueCalendarSun": MessageLookupByLibrary.simpleMessage("الأحد"),
    "venueCalendarThu": MessageLookupByLibrary.simpleMessage("الخميس"),
    "venueCalendarTue": MessageLookupByLibrary.simpleMessage("الثلاثاء"),
    "venueCalendarWed": MessageLookupByLibrary.simpleMessage("الأربعاء"),
    "venueCallPhoneLabel": m8,
    "venueClosedAtLabel": MessageLookupByLibrary.simpleMessage("وقت الإغلاق"),
    "venueDateLabel": MessageLookupByLibrary.simpleMessage("التاريخ"),
    "venueDepositNeedLabel": MessageLookupByLibrary.simpleMessage(
      "الوديعة المطلوبة : ",
    ),
    "venueFacilitiesSeeMore": MessageLookupByLibrary.simpleMessage(
      "عرض المزيد",
    ),
    "venueFacilitiesTitle": MessageLookupByLibrary.simpleMessage("المرافق"),
    "venueFeesLabel": MessageLookupByLibrary.simpleMessage("الرسوم"),
    "venueFiltersComingSoonMessage": MessageLookupByLibrary.simpleMessage(
      "الفلاتر متوفرة قريبًا",
    ),
    "venueFromYourLocationLabel": MessageLookupByLibrary.simpleMessage(
      "من موقعك",
    ),
    "venueLocationTitle": MessageLookupByLibrary.simpleMessage("الموقع"),
    "venueMenuLabel": MessageLookupByLibrary.simpleMessage("القائمة"),
    "venueNextButton": MessageLookupByLibrary.simpleMessage("التالي"),
    "venueOpeningAtLabel": MessageLookupByLibrary.simpleMessage("وقت الفتح"),
    "venuePaymentMethodApplePay": MessageLookupByLibrary.simpleMessage(
      "أبل باي",
    ),
    "venuePaymentMethodLabel": MessageLookupByLibrary.simpleMessage(
      "طريقة الدفع",
    ),
    "venuePaymentMethodNewCard": MessageLookupByLibrary.simpleMessage(
      "بطاقة جديدة",
    ),
    "venuePaymentSummaryTitle": MessageLookupByLibrary.simpleMessage(
      "ملخص الدفع",
    ),
    "venuePerPersonSuffix": MessageLookupByLibrary.simpleMessage("/للشخص"),
    "venuePmLabel": MessageLookupByLibrary.simpleMessage("م"),
    "venuePolicyTitle": MessageLookupByLibrary.simpleMessage("السياسة"),
    "venuePriceLabel": m9,
    "venueReviewLabel": MessageLookupByLibrary.simpleMessage("التقييم "),
    "venueSeeLocationOnMapButton": MessageLookupByLibrary.simpleMessage(
      "عرض الموقع على الخريطة",
    ),
    "venueSubTotalLabel": MessageLookupByLibrary.simpleMessage(
      "المجموع الفرعي",
    ),
    "venueTimeLabel": MessageLookupByLibrary.simpleMessage("الوقت"),
    "venueTotalAmountLabel": MessageLookupByLibrary.simpleMessage(
      "المبلغ الإجمالي",
    ),
    "venueViewBookingDetailsButton": MessageLookupByLibrary.simpleMessage(
      "عرض تفاصيل الحجز",
    ),
  };
}
