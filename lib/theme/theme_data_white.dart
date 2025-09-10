import 'package:flutter/material.dart';
import 'package:to_do_app/utils/app_color_light.dart';

ThemeData getThemeDataLight() {
  return ThemeData(
    cardColor: Colors.white,
    primaryColor: Colors.white,
    iconTheme: const IconThemeData(color: AppColorLight.fontColor),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColorLight.appColor,
      iconTheme: IconThemeData(color: AppColorLight.fontColor),
      titleTextStyle: TextStyle(
        color: AppColorLight.fontColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      foregroundColor: AppColorLight.fontColor,
    ),
    scaffoldBackgroundColor: AppColorLight.appColor,

    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 28,
        letterSpacing: 0.5,
        color: AppColorLight.fontColor,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColorLight.fontColor,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xff5A5A5A),
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        letterSpacing: 0.5,
        color: AppColorLight.fontColor,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: const TextStyle(color: Colors.black54),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorLight.mainColor,
        foregroundColor: AppColorLight.fontColor,
        textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColorLight.mainColor,
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColorLight.appColor,
      selectedItemColor: AppColorLight.mainColor,
      unselectedItemColor: Color(0xffC6C6C6),
    ),
  );
}
