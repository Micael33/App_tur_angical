import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF0D47A1); // Blue
  static const Color secondaryColor = Color(0xFFFBC02D); // Yellow (Contrast)
  static const Color errorColor = Color(0xFFB00020);

  // High Contrast Colors
  static const Color highContrastPrimary = Color(0xFF000000);
  static const Color highContrastSecondary = Color(0xFFFFFF00);
  static const Color highContrastBackground = Color(0xFFFFFFFF);
  static const Color highContrastSurface = Color(0xFFEEEEEE);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        secondary: secondaryColor,
        error: errorColor,
        brightness: Brightness.light,
      ),
      textTheme: GoogleFonts.lexendTextTheme().apply(
        bodyColor: Colors.black87,
        displayColor: Colors.black,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size(48, 48), // Accessibiliy: Minimum touch target
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
    );
  }

  static ThemeData get highContrastTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: highContrastPrimary,
        onPrimary: Colors.white,
        secondary: highContrastSecondary,
        onSecondary: Colors.black,
        error: errorColor,
        onError: Colors.white,
        surface: highContrastBackground,
        onSurface: Colors.black,
      ),
      textTheme: GoogleFonts.lexendTextTheme().copyWith(
        bodyLarge: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        bodyMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        titleLarge: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Colors.black),
      ),
      scaffoldBackgroundColor: highContrastBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: highContrastPrimary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: highContrastPrimary,
          foregroundColor: Colors.white,
          minimumSize: const Size(56, 56), // Larger target for motor impairment
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: const BorderSide(color: Colors.white, width: 2)),
        ),
      ),
      iconTheme: const IconThemeData(size: 32, color: Colors.black), 
    );
  }
}
