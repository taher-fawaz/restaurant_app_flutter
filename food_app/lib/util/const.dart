import 'package:flutter/material.dart';

class Constants {
  static String appName = "Foody Bite";

  //Colors for theme
  static Color lightPrimary = const Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = const Color(0xff5563ff);
  static Color darkAccent = const Color(0xff5563ff);
  static Color lightBG = const Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color ratingBG = Colors.yellow[600]!;

  static ThemeData lightTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(cursorColor: lightAccent),
    colorScheme: ColorScheme.light(
      background: lightBG,
      primary: lightPrimary,
      secondary: lightAccent,
      onBackground: lightBG,
    ),
    // backgroundColor: lightBG,
    // primaryColor: lightPrimary,
    // accentColor: lightAccent,
    // cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: darkBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
      toolbarTextStyle: TextStyle(
        color: darkBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
      // textTheme: TextTheme(
      //   headline6: TextStyle(
      //     color: darkBG,
      //     fontSize: 18.0,
      //     fontWeight: FontWeight.w800,
      //   ),
      // ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(cursorColor: darkAccent),

    colorScheme: ColorScheme.light(
        background: darkBG,
        primary: darkPrimary,
        secondary: darkAccent,
        onBackground: lightBG,
        brightness: Brightness.dark),
    // brightness: Brightness.dark,
    // backgroundColor: darkBG,
    // primaryColor: darkPrimary,
    // accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    // cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: lightBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
      toolbarTextStyle: TextStyle(
        color: lightBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
      // textTheme: TextTheme(
      //   headline6: TextStyle(
      //     color: lightBG,
      //     fontSize: 18.0,
      //     fontWeight: FontWeight.w800,
      //   ),
      // ),
    ),
  );
}
