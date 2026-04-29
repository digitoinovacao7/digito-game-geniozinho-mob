import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData get theme {
    ThemeData base = ThemeData.light();

    return base.copyWith(
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      cardColor: Colors.white,
      textTheme: base.textTheme.copyWith(
        bodySmall: base.textTheme.bodySmall!.copyWith(
          color: const Color(0xFF64748B),
          fontFamily: 'Poppins',
        ),
        bodyLarge: base.textTheme.bodyLarge!.copyWith(
          fontFamily: 'Poppins',
        ),
        bodyMedium: base.textTheme.bodyMedium!.copyWith(
          fontFamily: 'Poppins',
        ),
        titleMedium: base.textTheme.titleMedium!.copyWith(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: base.textTheme.titleSmall!.copyWith(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
        ),
      ),
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF4F46E5), // Indigo
        brightness: Brightness.light,
      ),
    );
  }

  static ThemeData get darkTheme {
    ThemeData base = ThemeData.dark();

    return base.copyWith(
      scaffoldBackgroundColor: const Color(0xFF0F172A), // Deep Navy
      cardColor: const Color(0xFF1E293B), // Slate Dark
      textTheme: base.textTheme.copyWith(
        bodySmall: base.textTheme.bodySmall!.copyWith(
          color: const Color(0xFF94A3B8),
          fontFamily: 'Poppins',
        ),
        bodyLarge: base.textTheme.bodyLarge!.copyWith(
          fontFamily: 'Poppins',
          color: Colors.white,
        ),
        bodyMedium: base.textTheme.bodyMedium!.copyWith(
          fontFamily: 'Poppins',
          color: const Color(0xFFE2E8F0),
        ),
        titleMedium: base.textTheme.titleMedium!.copyWith(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        titleSmall: base.textTheme.titleSmall!.copyWith(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF818CF8), // Lighter Indigo for dark mode
        brightness: Brightness.dark,
      ),
    );
  }
}

