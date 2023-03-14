import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Back Home`
  String get back_home {
    return Intl.message(
      'Back Home',
      name: 'back_home',
      desc: '',
      args: [],
    );
  }

  /// `Away`
  String get away {
    return Intl.message(
      'Away',
      name: 'away',
      desc: '',
      args: [],
    );
  }

  /// `Guest in`
  String get guest_in {
    return Intl.message(
      'Guest in',
      name: 'guest_in',
      desc: '',
      args: [],
    );
  }

  /// `Add a Scene`
  String get add_a_scene {
    return Intl.message(
      'Add a Scene',
      name: 'add_a_scene',
      desc: '',
      args: [],
    );
  }

  /// `Save home setting as preset`
  String get save_home_setting_as_preset {
    return Intl.message(
      'Save home setting as preset',
      name: 'save_home_setting_as_preset',
      desc: '',
      args: [],
    );
  }

  /// `Give Scene Title`
  String get give_scene_title {
    return Intl.message(
      'Give Scene Title',
      name: 'give_scene_title',
      desc: '',
      args: [],
    );
  }

  /// `Child mode`
  String get child_mode {
    return Intl.message(
      'Child mode',
      name: 'child_mode',
      desc: '',
      args: [],
    );
  }

  /// `Change Scene`
  String get change_scene {
    return Intl.message(
      'Change Scene',
      name: 'change_scene',
      desc: '',
      args: [],
    );
  }

  /// `Mostly Clear`
  String get mostly_clear {
    return Intl.message(
      'Mostly Clear',
      name: 'mostly_clear',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continuee {
    return Intl.message(
      'Continue',
      name: 'continuee',
      desc: '',
      args: [],
    );
  }

  /// `Bedroom`
  String get bedroom {
    return Intl.message(
      'Bedroom',
      name: 'bedroom',
      desc: '',
      args: [],
    );
  }

  /// `Living Room`
  String get living_room {
    return Intl.message(
      'Living Room',
      name: 'living_room',
      desc: '',
      args: [],
    );
  }

  /// `Kitchen`
  String get kitchen {
    return Intl.message(
      'Kitchen',
      name: 'kitchen',
      desc: '',
      args: [],
    );
  }

  /// `Parking`
  String get parking {
    return Intl.message(
      'Parking',
      name: 'parking',
      desc: '',
      args: [],
    );
  }

  /// `Backyard`
  String get backyard {
    return Intl.message(
      'Backyard',
      name: 'backyard',
      desc: '',
      args: [],
    );
  }

  /// `Add room`
  String get add_room {
    return Intl.message(
      'Add room',
      name: 'add_room',
      desc: '',
      args: [],
    );
  }

  /// `Rooms`
  String get rooms {
    return Intl.message(
      'Rooms',
      name: 'rooms',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `FAQs`
  String get faqs {
    return Intl.message(
      'FAQs',
      name: 'faqs',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get terms_conditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'terms_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Hi Mate`
  String get hi_mate {
    return Intl.message(
      'Hi Mate',
      name: 'hi_mate',
      desc: '',
      args: [],
    );
  }

  /// `Sign in Now`
  String get sign_in_now {
    return Intl.message(
      'Sign in Now',
      name: 'sign_in_now',
      desc: '',
      args: [],
    );
  }

  /// `Enter Phone Number`
  String get enter_phone_number {
    return Intl.message(
      'Enter Phone Number',
      name: 'enter_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Or Continue with`
  String get or_continue_with {
    return Intl.message(
      'Or Continue with',
      name: 'or_continue_with',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Facebook`
  String get continue_with_facebook {
    return Intl.message(
      'Continue with Facebook',
      name: 'continue_with_facebook',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get continue_with_google {
    return Intl.message(
      'Continue with Google',
      name: 'continue_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Apple`
  String get continue_with_apple {
    return Intl.message(
      'Continue with Apple',
      name: 'continue_with_apple',
      desc: '',
      args: [],
    );
  }

  /// `Sign up Now`
  String get sign_up_now {
    return Intl.message(
      'Sign up Now',
      name: 'sign_up_now',
      desc: '',
      args: [],
    );
  }

  /// `Looks like you’re not registered yet`
  String get looks_like_not_registered {
    return Intl.message(
      'Looks like you’re not registered yet',
      name: 'looks_like_not_registered',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message(
      'Full Name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email_address {
    return Intl.message(
      'Email Address',
      name: 'email_address',
      desc: '',
      args: [],
    );
  }

  /// `By Continue you’re agreed to our`
  String get by_continue_you_agree {
    return Intl.message(
      'By Continue you’re agreed to our',
      name: 'by_continue_you_agree',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `Add verification code sent on your number`
  String get add_verification_code_sent {
    return Intl.message(
      'Add verification code sent on your number',
      name: 'add_verification_code_sent',
      desc: '',
      args: [],
    );
  }

  /// `Enter 6 digit verification code`
  String get enter_six_digit_code {
    return Intl.message(
      'Enter 6 digit verification code',
      name: 'enter_six_digit_code',
      desc: '',
      args: [],
    );
  }

  /// `Air condition`
  String get air_condition {
    return Intl.message(
      'Air conditioner',
      name: 'air_conditioner',
      desc: '',
      args: [],
    );
  }

  /// `Ceiling Lights`
  String get ceiling_lights {
    return Intl.message(
      'Ceiling Lights',
      name: 'ceiling_lights',
      desc: '',
      args: [],
    );
  }

  /// `View Profile`
  String get view_profile {
    return Intl.message(
      'View Profile',
      name: 'view_profile',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get day {
    return Intl.message(
      'Day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `Week`
  String get week {
    return Intl.message(
      'Week',
      name: 'week',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get month {
    return Intl.message(
      'Month',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get year {
    return Intl.message(
      'Year',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `used`
  String get used {
    return Intl.message(
      'used',
      name: 'used',
      desc: '',
      args: [],
    );
  }

  /// `Devices`
  String get devices {
    return Intl.message(
      'Devices',
      name: 'devices',
      desc: '',
      args: [],
    );
  }

  /// `Device Statistics`
  String get device_statistics {
    return Intl.message(
      'Device Statistics',
      name: 'device_statistics',
      desc: '',
      args: [],
    );
  }

  /// `increased`
  String get increased {
    return Intl.message(
      'increased',
      name: 'increased',
      desc: '',
      args: [],
    );
  }

  /// `from last month`
  String get from_last_month {
    return Intl.message(
      'from last month',
      name: 'from_last_month',
      desc: '',
      args: [],
    );
  }

  /// `Your Question got answered`
  String get your_question_got_answered {
    return Intl.message(
      'Your Question got answered',
      name: 'your_question_got_answered',
      desc: '',
      args: [],
    );
  }

  /// `General Questions`
  String get general_questions {
    return Intl.message(
      'General Questions',
      name: 'general_questions',
      desc: '',
      args: [],
    );
  }

  /// `Technical Questions`
  String get technical_questions {
    return Intl.message(
      'Technical Questions',
      name: 'technical_questions',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policies`
  String get privacy_policies {
    return Intl.message(
      'Privacy Policies',
      name: 'privacy_policies',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get select_language {
    return Intl.message(
      'Select Language',
      name: 'select_language',
      desc: '',
      args: [],
    );
  }

  /// `App Mode`
  String get app_mode {
    return Intl.message(
      'App Mode',
      name: 'app_mode',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Distance Unit`
  String get distance_unit {
    return Intl.message(
      'Distance Unit',
      name: 'distance_unit',
      desc: '',
      args: [],
    );
  }

  /// `Km (Kilometer)`
  String get km_kilometer {
    return Intl.message(
      'Km (Kilometer)',
      name: 'km_kilometer',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Company’s Terms of use`
  String get company_terms {
    return Intl.message(
      'Company’s Terms of use',
      name: 'company_terms',
      desc: '',
      args: [],
    );
  }

  /// `Motion Detected`
  String get motion_detected {
    return Intl.message(
      'Motion Detected',
      name: 'motion_detected',
      desc: '',
      args: [],
    );
  }

  /// `Sound Detected`
  String get sound_detected {
    return Intl.message(
      'Sound Detected',
      name: 'sound_detected',
      desc: '',
      args: [],
    );
  }

  /// `Living Room Cam`
  String get living_room_cam {
    return Intl.message(
      'Living Room Cam',
      name: 'living_room_cam',
      desc: '',
      args: [],
    );
  }

  /// `Click to change camera`
  String get click_to_change_camera {
    return Intl.message(
      'Click to change camera',
      name: 'click_to_change_camera',
      desc: '',
      args: [],
    );
  }

  /// `Live`
  String get live {
    return Intl.message(
      'Live',
      name: 'live',
      desc: '',
      args: [],
    );
  }

  /// `Front yard`
  String get front_yard {
    return Intl.message(
      'Front yard',
      name: 'front_yard',
      desc: '',
      args: [],
    );
  }

  /// `Back yard`
  String get back_yard {
    return Intl.message(
      'Back yard',
      name: 'back_yard',
      desc: '',
      args: [],
    );
  }

  /// `Click to play`
  String get click_to_play {
    return Intl.message(
      'Click to play',
      name: 'click_to_play',
      desc: '',
      args: [],
    );
  }

  /// `COOL`
  String get cool {
    return Intl.message(
      'COOL',
      name: 'cool',
      desc: '',
      args: [],
    );
  }

  /// `MODE`
  String get mode {
    return Intl.message(
      'MODE',
      name: 'mode',
      desc: '',
      args: [],
    );
  }

  /// `SET TEMP.`
  String get set_temp {
    return Intl.message(
      'SET TEMP.',
      name: 'set_temp',
      desc: '',
      args: [],
    );
  }

  /// `MID`
  String get mid {
    return Intl.message(
      'MID',
      name: 'mid',
      desc: '',
      args: [],
    );
  }

  /// `FAN`
  String get fan {
    return Intl.message(
      'FAN',
      name: 'fan',
      desc: '',
      args: [],
    );
  }

  /// `Dishwasher`
  String get dishwasher {
    return Intl.message(
      'Dishwasher',
      name: 'dishwasher',
      desc: '',
      args: [],
    );
  }

  /// `CLEANED`
  String get cleaned {
    return Intl.message(
      'CLEANED',
      name: 'cleaned',
      desc: '',
      args: [],
    );
  }

  /// `Area`
  String get area {
    return Intl.message(
      'Area',
      name: 'area',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Charge`
  String get charge {
    return Intl.message(
      'Charge',
      name: 'charge',
      desc: '',
      args: [],
    );
  }

  /// `Light Wash`
  String get light_wash {
    return Intl.message(
      'Light Wash',
      name: 'light_wash',
      desc: '',
      args: [],
    );
  }

  /// `Normal Wash`
  String get normal_wash {
    return Intl.message(
      'Normal Wash',
      name: 'normal_wash',
      desc: '',
      args: [],
    );
  }

  /// `Hi-Temp Wash`
  String get hi_temp_wash {
    return Intl.message(
      'Hi-Temp Wash',
      name: 'hi_temp_wash',
      desc: '',
      args: [],
    );
  }

  /// `Rinse Only`
  String get rinse_only {
    return Intl.message(
      'Rinse Only',
      name: 'rinse_only',
      desc: '',
      args: [],
    );
  }

  /// `Study Light`
  String get study_light {
    return Intl.message(
      'Study Light',
      name: 'study_light',
      desc: '',
      args: [],
    );
  }

  /// `SET BRIGHTNESS`
  String get set_brightness {
    return Intl.message(
      'SET BRIGHTNESS',
      name: 'set_brightness',
      desc: '',
      args: [],
    );
  }

  /// `Bluetooth Speaker`
  String get bluetooth_speaker {
    return Intl.message(
      'Bluetooth Speaker',
      name: 'bluetooth_speaker',
      desc: '',
      args: [],
    );
  }

  /// `OPEN`
  String get open {
    return Intl.message(
      'OPEN',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `Vol`
  String get vol {
    return Intl.message(
      'Volume',
      name: 'volume',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Connecting`
  String get connecting {
    return Intl.message(
      'Connecting',
      name: 'connecting',
      desc: '',
      args: [],
    );
  }

  /// `Signal Checking`
  String get signal_checking {
    return Intl.message(
      'Signal Checking',
      name: 'signal_checking',
      desc: '',
      args: [],
    );
  }

  /// `Network Setup`
  String get network_setup {
    return Intl.message(
      'Network Setup',
      name: 'network_setup',
      desc: '',
      args: [],
    );
  }

  /// `Name this device`
  String get name_this_device {
    return Intl.message(
      'Name this device',
      name: 'name_this_device',
      desc: '',
      args: [],
    );
  }

  /// `Parking Camera`
  String get parking_camera {
    return Intl.message(
      'Parking Camera',
      name: 'parking_camera',
      desc: '',
      args: [],
    );
  }

  /// `Select Room`
  String get select_room {
    return Intl.message(
      'Select Room',
      name: 'select_room',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Music Speaker`
  String get music_speaker {
    return Intl.message(
      'Music Speaker',
      name: 'music_speaker',
      desc: '',
      args: [],
    );
  }

  /// `Smart Speaker`
  String get smart_speaker {
    return Intl.message(
      'Smart Speaker',
      name: 'smart_speaker',
      desc: '',
      args: [],
    );
  }

  /// `Selected`
  String get selected {
    return Intl.message(
      'Selected',
      name: 'selected',
      desc: '',
      args: [],
    );
  }

  /// `Tap on device to select`
  String get tap_on_device_selected {
    return Intl.message(
      'Tap on device to select',
      name: 'tap_on_device_selected',
      desc: '',
      args: [],
    );
  }

  /// `Long press to manage devices`
  String get long_press_to_manage {
    return Intl.message(
      'Long press to manage devices',
      name: 'long_press_to_manage',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get remove {
    return Intl.message(
      'Remove',
      name: 'remove',
      desc: '',
      args: [],
    );
  }

  /// `Move`
  String get move {
    return Intl.message(
      'Move',
      name: 'move',
      desc: '',
      args: [],
    );
  }

  /// `Connected`
  String get connected {
    return Intl.message(
      'Connected',
      name: 'connected',
      desc: '',
      args: [],
    );
  }

  /// `Disconnected`
  String get disconnected {
    return Intl.message(
      'Disconnected',
      name: 'disconnected',
      desc: '',
      args: [],
    );
  }

  /// `Air Conditioner`
  String get air_conditioner {
    return Intl.message(
      'Air Conditioner',
      name: 'air_conditioner',
      desc: '',
      args: [],
    );
  }

  /// `Dining Room`
  String get dining_room {
    return Intl.message(
      'Dining Room',
      name: 'dining_room',
      desc: '',
      args: [],
    );
  }

  /// `Move Device(s)`
  String get move_devices {
    return Intl.message(
      'Move Device(s)',
      name: 'move_devices',
      desc: '',
      args: [],
    );
  }

  /// `Select Where to move`
  String get select_where_to_move {
    return Intl.message(
      'Select Where to move',
      name: 'select_where_to_move',
      desc: '',
      args: [],
    );
  }

  /// `Remove Device(s)`
  String get remove_devices {
    return Intl.message(
      'Remove Device(s)',
      name: 'remove_devices',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to remove selected device(s)?`
  String get are_you_sure {
    return Intl.message(
      'Are you sure you want to remove selected device(s)?',
      name: 'are_you_sure',
      desc: '',
      args: [],
    );
  }

  /// `Yes, you can add it later.`
  String get yes_you_can_add_later {
    return Intl.message(
      'Yes, you can add it later.',
      name: 'yes_you_can_add_later',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Instead you can move device in other room`
  String get instead_you_can_move {
    return Intl.message(
      'Instead you can move device in other room',
      name: 'instead_you_can_move',
      desc: '',
      args: [],
    );
  }

  /// `Searching Nearby Devices...`
  String get searching_nearby {
    return Intl.message(
      'Searching Nearby Devices...',
      name: 'searching_nearby',
      desc: '',
      args: [],
    );
  }

  /// `Make sure you're in connection`
  String get make_sure_connection {
    return Intl.message(
      'Make sure you\'re in connection',
      name: 'make_sure_connection',
      desc: '',
      args: [],
    );
  }

  /// `Music`
  String get music {
    return Intl.message(
      'Music',
      name: 'music',
      desc: '',
      args: [],
    );
  }

  /// `Television`
  String get television {
    return Intl.message(
      'Television',
      name: 'TV',
      desc: '',
      args: [],
    );
  }

  /// `Amazon Alexa`
  String get amazon_alexa {
    return Intl.message(
      'Amazon Alexa',
      name: 'amazon_alexa',
      desc: '',
      args: [],
    );
  }

  /// `Floor Cleaner`
  String get floor_cleaner {
    return Intl.message(
      'Floor Cleaner',
      name: 'floor_cleaner',
      desc: '',
      args: [],
    );
  }

  /// `Switch Off All Devices`
  String get switch_off_all_devices {
    return Intl.message(
      'Switch Off All Devices',
      name: 'switch_off_all_devices',
      desc: '',
      args: [],
    );
  }

  /// `Edit Room`
  String get edit_room {
    return Intl.message(
      'Edit Room',
      name: 'edit_room',
      desc: '',
      args: [],
    );
  }

  /// `Add/Remove Device`
  String get add_remove_device {
    return Intl.message(
      'Add/Remove Device',
      name: 'add_remove_device',
      desc: '',
      args: [],
    );
  }

  /// `Remove Room`
  String get remove_room {
    return Intl.message(
      'Remove Room',
      name: 'remove_room',
      desc: '',
      args: [],
    );
  }

  /// `Cameras`
  String get cameras {
    return Intl.message(
      'Cameras',
      name: 'cameras',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Select Preferred Language`
  String get select_preferred_language {
    return Intl.message(
      'Select Preferred Language',
      name: 'select_preferred_language',
      desc: '',
      args: [],
    );
  }

  /// `SUBMIT`
  String get submit {
    return Intl.message(
      'SUBMIT',
      name: 'submit',
      desc: '',
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
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'sw'),
      Locale.fromSubtags(languageCode: 'tr'),
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
