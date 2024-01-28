import 'package:flutter/material.dart';

enum AppTheme {lightTheme,darkTheme}

class AppThemes {
  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
      primaryColor: Colors.black,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
          .copyWith(secondary: Colors.blueAccent, brightness: Brightness.light),
      dividerColor: Colors.black54,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.grey, unselectedItemColor: Colors.white),
      // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
      //     .copyWith(background: const Color(0xFF212121)),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.black87,
        scrimColor: Colors.white
      )
    ),

    AppTheme.lightTheme: ThemeData(
      primaryColor: Colors.white,
      brightness: Brightness.light,
      dividerColor: const Color(0xff757575),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(color: Colors.black),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.grey,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(background: const Color(0xFFE5E5E5)),
    ),
  };
}