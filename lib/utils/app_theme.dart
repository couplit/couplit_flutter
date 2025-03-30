import 'package:flutter/material.dart';

class AppTheme {
  // 앱 컬러 테마
  static const Color primaryColor = Color(0xFF7B61FF);
  static const Color secondaryColor = Color(0xFFF2F2F7);
  static const Color accentColor = Color(0xFFFF6B6B);
  static const Color textColor = Color(0xFF2C2C2E);
  static const Color subTextColor = Color(0xFF8E8E93);
  static const Color backgroundColor = Colors.white;
  static const Color kakaoColor = Color(0xFFFEE500);
  static const Color appleColor = Color(0xFF000000);

  // 텍스트 스타일
  static const TextStyle headingStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: textColor,
    height: 1.2,
  );

  static const TextStyle subHeadingStyle = TextStyle(
    fontSize: 16,
    color: subTextColor,
    height: 1.5,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  // 버튼 스타일
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    elevation: 0,
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    ),
  );

  static final ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: textColor,
    side: const BorderSide(color: Color(0xFFE5E5EA), width: 1),
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    ),
  );

  // 텍스트필드 스타일
  static final InputDecorationTheme textFieldDecorationTheme =
      InputDecorationTheme(
    filled: true,
    fillColor: secondaryColor,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: primaryColor, width: 1),
    ),
    hintStyle: const TextStyle(
      color: subTextColor,
      fontSize: 16,
    ),
  );

  static final InputDecoration textFieldDecoration = InputDecoration(
    filled: true,
    fillColor: secondaryColor,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: primaryColor, width: 1),
    ),
    hintStyle: const TextStyle(
      color: subTextColor,
      fontSize: 16,
    ),
  );

  // Material 테마
  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        secondary: secondaryColor,
      ),
      textTheme: const TextTheme(
        displayLarge: headingStyle,
        bodyLarge: subHeadingStyle,
        labelLarge: buttonTextStyle,
      ),
      useMaterial3: true,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: primaryButtonStyle,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: outlinedButtonStyle,
      ),
      inputDecorationTheme: textFieldDecorationTheme,
    );
  }
}
