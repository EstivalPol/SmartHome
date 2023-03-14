import 'package:flutter/material.dart';

class AppTheme {
  //Color
  static String fontFamily = 'ProductSans';
  static Color scaffoldBackgroundColor = const Color(0xff1f232c);
  static Color primaryColor = const Color(0xff1f232c);
  static Color primaryColorLight = const Color(0xff2a2e3a);
  static Color primaryColorDark = const Color(0xff181b21);
  static Color lightGreyColor = const Color(0xff5c6276);
  static Color whiteTextColor = const Color(0xffffffff);
  static Color textFieldBackgroundColor = const Color(0xff181919);
  static Color powerOnColor1 = Color.fromARGB(255, 4, 62, 148);
  static Color powerOnColor2 = Color.fromARGB(255, 187, 174, 1);
  static Color powerOnColor3 = Color.fromARGB(255, 67, 121, 6);
  static Color powerOnColor4 = Color.fromARGB(255, 201, 5, 5);
  static Color powerOnColor5 = Color.fromARGB(255, 199, 121, 3);
  static Color powerOnColor6 = Color.fromARGB(255, 117, 4, 154);

  static BoxDecoration insetDecoration({double? borderRadius}) => BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 40),
        boxShadow: [
          BoxShadow(
            color: AppTheme.lightGreyColor,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            spreadRadius: -0.0,
            blurRadius: 1,
          ),
        ],
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.7),
            Colors.black.withOpacity(0.4),
            AppTheme.textFieldBackgroundColor,
          ],
          stops: const [0.0, 0.2, 0.95],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );

  static BoxDecoration poppedDecoration({double? borderRadius}) =>
      BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 40),
        boxShadow: [
          BoxShadow(
            color: AppTheme.whiteTextColor.withOpacity(0.3),
            offset: const Offset(0, -3),
            blurRadius: 4,
            spreadRadius: 0,
          ),
          const BoxShadow(
            color: Colors.black,
            offset: Offset(0, 3),
            blurRadius: 5,
            spreadRadius: -4,
          ),
        ],
      );

  static ThemeData appTheme = ThemeData(
    fontFamily: fontFamily,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,

    ///appBar theme
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: primaryColor,
    ),

    ///text theme
    textTheme: TextTheme(
      caption: TextStyle(
        color: lightGreyColor,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: TextStyle(
        color: whiteTextColor,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      bodyText2: TextStyle(
        color: whiteTextColor,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

const SizedBox heightSpace40 = SizedBox(height: 40);

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
