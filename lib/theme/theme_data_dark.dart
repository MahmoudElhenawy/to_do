import 'package:flutter/material.dart';
import 'package:to_do_app/utils/app_color_dark.dart';

ThemeData getThemeDataDark() {
  return ThemeData(
    cardColor: const Color(0xff282828),
    iconTheme: const IconThemeData(color: AppColorDark.fontColor),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColorDark.appColor,
      titleTextStyle: TextStyle(
        color: AppColorDark.fontColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      foregroundColor: AppColorDark.fontColor,
    ),
    scaffoldBackgroundColor: AppColorDark.appColor,

    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 28,
        letterSpacing: 0.5,
        color: AppColorDark.fontColor,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColorDark.fontColor,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xffC6C6C6),
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        letterSpacing: 0.5,
        color: AppColorDark.fontColor,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF282828),
      hintStyle: const TextStyle(color: Colors.white70),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(AppColorDark.fontColor),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorDark.mainColor,
        foregroundColor: AppColorDark.fontColor,
        textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColorDark.mainColor,
      foregroundColor: AppColorDark.fontColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColorDark.appColor,
      selectedItemColor: AppColorDark.mainColor,
      unselectedItemColor: Color(0xffC6C6C6),
    ),
  );
}
