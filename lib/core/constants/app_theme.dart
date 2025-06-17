import 'package:anime_flix/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  /// Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColor.backgroundLight,
      primaryColor: AppColor.primaryColor,
      appBarTheme: _appBarTheme(isDark: false),
      textTheme: _textTheme(isDark: false),
      listTileTheme: _listTileTheme(isDark: false),
      elevatedButtonTheme: _buttonTheme(isDark: false),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryColor,
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  /// Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColor.backgroundDark,
      primaryColor: AppColor.primaryColor,
      appBarTheme: _appBarTheme(isDark: true),
      textTheme: _textTheme(isDark: true),
      listTileTheme: _listTileTheme(isDark: true),
      elevatedButtonTheme: _buttonTheme(isDark: true),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryColor,
      ),
      cardTheme: CardTheme(
        color: const Color(0xFF1E1E1E),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  /// AppBar Theme
  static AppBarTheme _appBarTheme({required bool isDark}) {
    return AppBarTheme(
      backgroundColor: isDark ? const Color(0xFF1C1C1E) : AppColor.primaryColor,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
      elevation: 2,
    );
  }

  /// ListTile Theme
  static ListTileThemeData _listTileTheme({required bool isDark}) {
    return ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      tileColor: isDark ? const Color(0xFF1F1F1F) : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      iconColor: isDark ? Colors.white : AppColor.primaryColor,
      textColor: isDark ? Colors.white70 : Colors.black87,
    );
  }

  /// Text Theme
  static TextTheme _textTheme({required bool isDark}) {
    return TextTheme(
      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: isDark ? Colors.white : Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: isDark ? Colors.white70 : Colors.black87,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: isDark ? Colors.white60 : Colors.black87,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: isDark ? Colors.grey[400] : Colors.grey[800],
      ),
    );
  }

  /// Elevated Button Theme
  static ElevatedButtonThemeData _buttonTheme({required bool isDark}) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
