import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_zh.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///

abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('hi'),
    Locale('id'),
    Locale('zh')
  ];

  /// No description provided for @onBoard1Title.
  ///
  /// In en, this message translates to:
  /// **'Manage your smart connect'**
  String get onBoard1Title;

  /// No description provided for @onBoard1Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet, consecteturadipiscing elit. Laoreet quis sem eget lectus pharetra luctus in dui. Mi, venenatis id quis phasellus sed.'**
  String get onBoard1Subtitle;

  /// No description provided for @onBoard2Title.
  ///
  /// In en, this message translates to:
  /// **'Make life easy with smart connect'**
  String get onBoard2Title;

  /// No description provided for @onBoard2Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet, consecteturadipiscing elit. Laoreet quis sem eget lectus pharetra luctus in dui. Mi, venenatis id quis phasellus sed.'**
  String get onBoard2Subtitle;

  /// No description provided for @onBoard3Title.
  ///
  /// In en, this message translates to:
  /// **'Stay informed'**
  String get onBoard3Title;

  /// No description provided for @onBoard3Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet, consecteturadipiscing elit. Laoreet quis sem eget lectus pharetra luctus in dui. Mi, venenatis id quis phasellus sed.'**
  String get onBoard3Subtitle;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'skip'**
  String get skip;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get getStarted;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Smart Connect'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to smart connect please\nlogin your account'**
  String get loginSubtitle;

  /// No description provided for @weAreSending.
  ///
  /// In en, this message translates to:
  /// **'*we  are sending OTP for verification'**
  String get weAreSending;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @registerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to smart connect please\ncreate your account'**
  String get registerSubtitle;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'User name'**
  String get userName;

  /// No description provided for @enterYourName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterYourName;

  /// No description provided for @mobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get mobileNumber;

  /// No description provided for @enterMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your mobile number'**
  String get enterMobileNumber;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get emailAddress;

  /// No description provided for @enterEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get enterEmailAddress;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @otpVerification.
  ///
  /// In en, this message translates to:
  /// **'OTP verification'**
  String get otpVerification;

  /// No description provided for @otpVerificationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Confirmation code has been sent to your\nmobile no '**
  String get otpVerificationSubtitle;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @reSend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get reSend;

  /// No description provided for @pleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Please wait'**
  String get pleaseWait;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @helloSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to your smart home'**
  String get helloSubtitle;

  /// No description provided for @allRoom.
  ///
  /// In en, this message translates to:
  /// **'All Room'**
  String get allRoom;

  /// No description provided for @activeDevice.
  ///
  /// In en, this message translates to:
  /// **'Active device'**
  String get activeDevice;

  /// No description provided for @livingRoom1.
  ///
  /// In en, this message translates to:
  /// **'Living room'**
  String get livingRoom1;

  /// No description provided for @kitchen.
  ///
  /// In en, this message translates to:
  /// **'Kitchen'**
  String get kitchen;

  /// No description provided for @bedRoom.
  ///
  /// In en, this message translates to:
  /// **'Bedroom'**
  String get bedRoom;

  /// No description provided for @bathRoom.
  ///
  /// In en, this message translates to:
  /// **'Bathroom'**
  String get bathRoom;

  /// No description provided for @kidsRoom.
  ///
  /// In en, this message translates to:
  /// **'Kid\'s room'**
  String get kidsRoom;

  /// No description provided for @office.
  ///
  /// In en, this message translates to:
  /// **'Office'**
  String get office;

  /// No description provided for @tvRoom.
  ///
  /// In en, this message translates to:
  /// **'Tv room'**
  String get tvRoom;

  /// No description provided for @parking.
  ///
  /// In en, this message translates to:
  /// **'Parking'**
  String get parking;

  /// No description provided for @airCondition1.
  ///
  /// In en, this message translates to:
  /// **'Air Condition'**
  String get airCondition1;

  /// No description provided for @smartLamp.
  ///
  /// In en, this message translates to:
  /// **'Smart Lamp'**
  String get smartLamp;

  /// No description provided for @smartFan.
  ///
  /// In en, this message translates to:
  /// **'Smart Fan'**
  String get smartFan;

  /// No description provided for @smartTv.
  ///
  /// In en, this message translates to:
  /// **'Smart TV'**
  String get smartTv;

  /// No description provided for @speaker.
  ///
  /// In en, this message translates to:
  /// **'Speaker'**
  String get speaker;

  /// No description provided for @wifiRouter.
  ///
  /// In en, this message translates to:
  /// **'Wifi Router'**
  String get wifiRouter;

  /// No description provided for @music.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get music;

  /// No description provided for @isOnLast.
  ///
  /// In en, this message translates to:
  /// **'is on last'**
  String get isOnLast;

  /// No description provided for @hour.
  ///
  /// In en, this message translates to:
  /// **'hour'**
  String get hour;

  /// No description provided for @thisRoomTemp.
  ///
  /// In en, this message translates to:
  /// **'This room temperature'**
  String get thisRoomTemp;

  /// No description provided for @outsideTemp.
  ///
  /// In en, this message translates to:
  /// **'Outside temperature'**
  String get outsideTemp;

  /// No description provided for @mode.
  ///
  /// In en, this message translates to:
  /// **'Mode'**
  String get mode;

  /// No description provided for @turbo.
  ///
  /// In en, this message translates to:
  /// **'Turbo'**
  String get turbo;

  /// No description provided for @eco.
  ///
  /// In en, this message translates to:
  /// **'Eco'**
  String get eco;

  /// No description provided for @dry.
  ///
  /// In en, this message translates to:
  /// **'Dry'**
  String get dry;

  /// No description provided for @auto.
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get auto;

  /// No description provided for @cool.
  ///
  /// In en, this message translates to:
  /// **'Cool'**
  String get cool;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @createSchedule.
  ///
  /// In en, this message translates to:
  /// **'Create schedule'**
  String get createSchedule;

  /// No description provided for @scheduleTitle.
  ///
  /// In en, this message translates to:
  /// **'Schedule title'**
  String get scheduleTitle;

  /// No description provided for @enterScheduleTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter schedule title'**
  String get enterScheduleTitle;

  /// No description provided for @startTime.
  ///
  /// In en, this message translates to:
  /// **'Start time'**
  String get startTime;

  /// No description provided for @endTime.
  ///
  /// In en, this message translates to:
  /// **'End time'**
  String get endTime;

  /// No description provided for @selectDay.
  ///
  /// In en, this message translates to:
  /// **'Select day'**
  String get selectDay;

  /// No description provided for @sun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sun;

  /// No description provided for @mon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get mon;

  /// No description provided for @tue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tue;

  /// No description provided for @wed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wed;

  /// No description provided for @thu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thu;

  /// No description provided for @fri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get fri;

  /// No description provided for @sat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get sat;

  /// No description provided for @device.
  ///
  /// In en, this message translates to:
  /// **'Device'**
  String get device;

  /// No description provided for @addNewDevice.
  ///
  /// In en, this message translates to:
  /// **'Add new device'**
  String get addNewDevice;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @selectDevice.
  ///
  /// In en, this message translates to:
  /// **'Select device'**
  String get selectDevice;

  /// No description provided for @deviceIsIn.
  ///
  /// In en, this message translates to:
  /// **'Device is in'**
  String get deviceIsIn;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @musicSystem.
  ///
  /// In en, this message translates to:
  /// **'Music System'**
  String get musicSystem;

  /// No description provided for @airCondition2.
  ///
  /// In en, this message translates to:
  /// **'AirCondition'**
  String get airCondition2;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @livingRoom2.
  ///
  /// In en, this message translates to:
  /// **'Livingroom'**
  String get livingRoom2;

  /// No description provided for @smartMusicSystem.
  ///
  /// In en, this message translates to:
  /// **'Smart music system'**
  String get smartMusicSystem;

  /// No description provided for @connected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get connected;

  /// No description provided for @volume.
  ///
  /// In en, this message translates to:
  /// **'Volume'**
  String get volume;

  /// No description provided for @livingRoomDevice.
  ///
  /// In en, this message translates to:
  /// **'Living room device'**
  String get livingRoomDevice;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @areYouSureDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this device?'**
  String get areYouSureDelete;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @emptyDeviceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'There are no devices yet'**
  String get emptyDeviceSubtitle;

  /// No description provided for @searchNearByDevice.
  ///
  /// In en, this message translates to:
  /// **'Search near by device'**
  String get searchNearByDevice;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @deviceAddSuccess.
  ///
  /// In en, this message translates to:
  /// **'Device add successfully'**
  String get deviceAddSuccess;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to home'**
  String get backToHome;

  /// No description provided for @newRoom.
  ///
  /// In en, this message translates to:
  /// **'New room'**
  String get newRoom;

  /// No description provided for @newDevice.
  ///
  /// In en, this message translates to:
  /// **'New device'**
  String get newDevice;

  /// No description provided for @createNewRoom.
  ///
  /// In en, this message translates to:
  /// **'Create new room'**
  String get createNewRoom;

  /// No description provided for @enterRoomName.
  ///
  /// In en, this message translates to:
  /// **'Enter room name'**
  String get enterRoomName;

  /// No description provided for @selectIcon.
  ///
  /// In en, this message translates to:
  /// **'Select icon'**
  String get selectIcon;

  /// No description provided for @statics.
  ///
  /// In en, this message translates to:
  /// **'Statics'**
  String get statics;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get thisWeek;

  /// No description provided for @thisMonth.
  ///
  /// In en, this message translates to:
  /// **'This month'**
  String get thisMonth;

  /// No description provided for @powerConsumed.
  ///
  /// In en, this message translates to:
  /// **'Power consumed'**
  String get powerConsumed;

  /// No description provided for @room.
  ///
  /// In en, this message translates to:
  /// **'Room'**
  String get room;

  /// No description provided for @increase.
  ///
  /// In en, this message translates to:
  /// **'increase'**
  String get increase;

  /// No description provided for @decrease.
  ///
  /// In en, this message translates to:
  /// **'decrease'**
  String get decrease;

  /// No description provided for @schedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get schedule;

  /// No description provided for @scheduleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create your routine schedule'**
  String get scheduleSubtitle;

  /// No description provided for @allDay.
  ///
  /// In en, this message translates to:
  /// **'All day'**
  String get allDay;

  /// No description provided for @morning.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get morning;

  /// No description provided for @afternoon.
  ///
  /// In en, this message translates to:
  /// **'Afternoon'**
  String get afternoon;

  /// No description provided for @evening.
  ///
  /// In en, this message translates to:
  /// **'Evening'**
  String get evening;

  /// No description provided for @night.
  ///
  /// In en, this message translates to:
  /// **'Night'**
  String get night;

  /// No description provided for @everyDay.
  ///
  /// In en, this message translates to:
  /// **'Every day'**
  String get everyDay;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get goodMorning;

  /// No description provided for @houseKeeping.
  ///
  /// In en, this message translates to:
  /// **'House keeping'**
  String get houseKeeping;

  /// No description provided for @movieNight.
  ///
  /// In en, this message translates to:
  /// **'Movie night'**
  String get movieNight;

  /// No description provided for @sleep.
  ///
  /// In en, this message translates to:
  /// **'Sleep'**
  String get sleep;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @termsCondition1.
  ///
  /// In en, this message translates to:
  /// **'Terms and condition'**
  String get termsCondition1;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// No description provided for @helpAndSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & support'**
  String get helpAndSupport;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logOut;

  /// No description provided for @noNotificationYet.
  ///
  /// In en, this message translates to:
  /// **'No notification yet'**
  String get noNotificationYet;

  /// No description provided for @newNotification.
  ///
  /// In en, this message translates to:
  /// **'New notification'**
  String get newNotification;

  /// No description provided for @olderNotification.
  ///
  /// In en, this message translates to:
  /// **'Older notification'**
  String get olderNotification;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @termsCondition2.
  ///
  /// In en, this message translates to:
  /// **'Terms & condition'**
  String get termsCondition2;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get editProfile;

  /// No description provided for @changeProfilePhoto.
  ///
  /// In en, this message translates to:
  /// **'Change profile photo'**
  String get changeProfilePhoto;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @removeImage.
  ///
  /// In en, this message translates to:
  /// **'Remove Image'**
  String get removeImage;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @messageHintText.
  ///
  /// In en, this message translates to:
  /// **'Write your message here'**
  String get messageHintText;

  /// No description provided for @areYouSureForLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get areYouSureForLogout;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @writeMsgHere.
  ///
  /// In en, this message translates to:
  /// **'Write your message here'**
  String get writeMsgHere;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @dismissed.
  ///
  /// In en, this message translates to:
  /// **'dismissed'**
  String get dismissed;

  /// No description provided for @pressBackAgain.
  ///
  /// In en, this message translates to:
  /// **'Press back again to exit'**
  String get pressBackAgain;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @hindi.
  ///
  /// In en, this message translates to:
  /// **'हिन्दी'**
  String get hindi;

  /// No description provided for @indonesian.
  ///
  /// In en, this message translates to:
  /// **'bahasa Indonesia'**
  String get indonesian;

  /// No description provided for @chinese.
  ///
  /// In en, this message translates to:
  /// **'Cina'**
  String get chinese;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'عربي'**
  String get arabic;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'hi', 'id', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
