import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF137FEC); // From HTML
  static const Color backgroundLight = Color(0xFFF6F7F8); // From HTML
  static const Color backgroundDark = Color(0xFF101922); // From HTML
  static const Color surfaceLight = Colors.white;
  static const Color surfaceDark = Color(0xFF1E293B); // Slate 800 approx

  static const Color textDark = Color(0xFF0F172A); // Slate 900
  static const Color textLight = Color(0xFFF1F5F9); // Slate 100
  
  // High Contrast Colors (Keeping existing logic)
  static const Color highContrastPrimary = Color(0xFF000000);
  static const Color highContrastSecondary = Color(0xFFFFFF00);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: backgroundLight,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        brightness: Brightness.light,
      ),
      textTheme: GoogleFonts.plusJakartaSansTextTheme().apply(
        bodyColor: textDark,
        displayColor: textDark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundLight,
        foregroundColor: textDark,
        elevation: 0,
      ),
      cardTheme: const CardThemeData(
        color: surfaceLight,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          side: BorderSide(color: Color(0xFFE2E8F0)), // Slate 200
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)), // WCAG: visible border
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFFE2E8F0),
            width: 1.5, // WCAG: visible border for focus
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: primaryColor,
            width: 2.5, // WCAG: visible focus indicator
          ),
        ),
        hintStyle: const TextStyle(color: Color(0xFF94A3B8)), // Slate 400
        labelStyle: const TextStyle(
          color: Color(0xFF64748B),
          fontWeight: FontWeight.w600, // Better visibility
        ),
        errorStyle: const TextStyle(
          color: Color(0xFFDC2626), // High contrast error
          fontWeight: FontWeight.w500,
        ),
        helperStyle: const TextStyle(
          color: Color(0xFF75869E), // Helper text color
          fontSize: 12,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14), // WCAG: 48px min tap target
      ),
      // Button theme for accessibility
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(48, 48), // WCAG: 48x48 tap target
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(48, 48), // WCAG: 48x48 tap target
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          minimumSize: const Size(48, 48), // WCAG: 48x48 tap target
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: backgroundDark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        brightness: Brightness.dark,
      ),
       textTheme: GoogleFonts.plusJakartaSansTextTheme().apply(
        bodyColor: textLight,
        displayColor: textLight,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundDark,
        foregroundColor: textLight,
        elevation: 0,
      ),
      cardTheme: const CardThemeData(
        color: surfaceDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          side: BorderSide(color: Color(0xFF334155)), // Slate 700
        ),
      ),
       inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF334155)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFF334155),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: primaryColor,
            width: 2.5,
          ),
        ),
        hintStyle: const TextStyle(color: Color(0xFF94A3B8)),
        labelStyle: const TextStyle(
          color: Color(0xFF94A3B8),
          fontWeight: FontWeight.w600,
        ),
        errorStyle: const TextStyle(
          color: Color(0xFFFCA5A5), // Lighter error for dark mode
          fontWeight: FontWeight.w500,
        ),
        helperStyle: const TextStyle(
          color: Color(0xFF7A8AA8),
          fontSize: 12,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(48, 48),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(48, 48),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          minimumSize: const Size(48, 48),
        ),
      ),
    );
  }

  // Keeping High Contrast as a separate getters if needed/logic is preserved in main
  static ThemeData get highContrastTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      colorScheme: const ColorScheme.dark(
        primary: Colors.white,
        secondary: Colors.yellow,
        surface: Colors.black,
        onSurface: Colors.white,
      ),
       textTheme: GoogleFonts.lexendTextTheme().apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ).copyWith(
        bodyLarge: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
