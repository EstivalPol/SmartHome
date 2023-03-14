import 'package:flutter/material.dart';
import 'package:smart_house/features/bottom_navigation/account/faq_screen.dart';
import 'package:smart_house/features/bottom_navigation/account/privacy_policy_screen.dart';
import 'package:smart_house/features/bottom_navigation/account/profile_screen.dart';
import 'package:smart_house/features/bottom_navigation/account/settings_screen.dart';
import 'package:smart_house/features/bottom_navigation/account/tnc_screen.dart';
import 'package:smart_house/features/bottom_navigation/bottom_navigation.dart';
import 'package:smart_house/features/bottom_navigation/cameras/camera_info.dart';
import 'package:smart_house/features/bottom_navigation/cameras/full_screen_camera.dart';
import 'package:smart_house/features/bottom_navigation/devices/add_device_info.dart';
import 'package:smart_house/features/bottom_navigation/devices/devices_info/ac_info.dart';
import 'package:smart_house/features/bottom_navigation/devices/devices_info/cleaner_info.dart';
import 'package:smart_house/features/bottom_navigation/devices/devices_info/dishwasher_info.dart';
import 'package:smart_house/features/bottom_navigation/devices/devices_info/lights_info.dart';
import 'package:smart_house/features/bottom_navigation/devices/devices_info/speaker_info.dart';
import 'package:smart_house/features/bottom_navigation/devices/devices_info/television_info.dart';
import 'package:smart_house/features/bottom_navigation/devices/move_device_screen.dart';
import 'package:smart_house/features/bottom_navigation/devices/remove_devices_screen.dart';
import 'package:smart_house/features/bottom_navigation/devices/search_device_screen.dart';
import 'package:smart_house/features/language/ui/language_page_ui.dart';

class PageRoutes {
  static const String bottomNavBar = 'home_page';
  static const String searchDevices = 'search_device';
  static const String addDeviceInfo = 'add_device';
  static const String moveDevicesScreen = 'move_device';
  static const String removeDevicesScreen = 'remove_device';
  static const String acInfoScreen = 'ac_info';
  static const String cleanerInfoScreen = 'cleaner_info';
  static const String televisionInfoScreen = 'television_info';
  static const String dishwasherInfoScreen = 'dishwasher_info';
  static const String lightsInfoScreen = 'lights_info';
  static const String speakerInfoScreen = 'speaker_info';
  static const String cameraInfoScreen = 'camera_info';
  static const String fullScreenCamera = 'full_screen_camera';
  static const String profileScreen = 'profile_screen';
  static const String faqScreen = 'faq_screen';
  static const String settingsScreen = 'settings_screen';
  static const String tncScreen = 'tnc_screen';
  static const String privacyPolicyScreen = 'privacy_screen';
  static const String languageChangeScreen = 'language_screen';

  Map<String, WidgetBuilder> routes() {
    return {
      bottomNavBar: (context) => const BottomBar(),
      searchDevices: (context) => const SearchDeviceScreen(),
      addDeviceInfo: (context) => const AddDeviceInfo(),
      moveDevicesScreen: (context) => const MoveDeviceScreen(),
      removeDevicesScreen: (context) => const RemoveDevicesScreen(),
      acInfoScreen: (context) => const ACInfoScreen(),
      cleanerInfoScreen: (context) => const CleanerInfoScreen(),
      televisionInfoScreen: (context) => const TelevisionInfoScreen(),
      dishwasherInfoScreen: (context) => const DishwasherInfoScreen(),
      lightsInfoScreen: (context) => const LightsInfoScreen(),
      speakerInfoScreen: (context) => const SpeakerInfoScreen(),
      cameraInfoScreen: (context) => const CameraInfoScreen(),
      fullScreenCamera: (context) => const FullScreenCamera(),
      profileScreen: (context) => const ProfileScreen(),
      faqScreen: (context) => const FAQScreen(),
      settingsScreen: (context) => const SettingsScreen(),
      tncScreen: (context) => const TncScreen(),
      privacyPolicyScreen: (context) => const PrivacyPolicyScreen(),
      languageChangeScreen: (context) => const LanguagePageUI(),
    };
  }
}
