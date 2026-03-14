import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const Color primary = Colors.blue;
  static const Color scaffoldBackground = Color(0xFFF8F9FA);
  static const Color surface = Colors.white;
  static const Color error = Colors.redAccent;

  static const Color textPrimary = Color(0xFF212529);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color greyLight = Color(0xFFE9ECEF);

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color red = Colors.red;

  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ];
}
