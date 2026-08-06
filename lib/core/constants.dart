import 'package:flutter/material.dart';

class AppConstants {
  static const String baseUrl = 'http://192.168.1.7:8081/api/v1';
  static const String seedUserId = 'c7133c5e-c490-4011-8941-a866dc9adbdd';
  static const String seedLocationId = 'f886cd8f-a0bb-4787-9459-c49d2ea84c4f';
}

class NeoColors {
  static const Color background = Color(0xFFF0F0EB);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF111111);
  static const Color primary = Color(0xFF6C5CE7);
  static const Color accent = Color(0xFFFFEAA7);
  static const Color green = Color(0xFF00B894);
  static const Color yellow = Color(0xFFFDCB6E);
  static const Color orange = Color(0xFFE17055);
  static const Color red = Color(0xFFD63031);
  static const Color text = Color(0xFF111111);
}

class NeoBorders {
  static const BorderSide thick = BorderSide(color: NeoColors.black, width: 3);
  static const BorderSide thin = BorderSide(color: NeoColors.black, width: 2);
}

class NeoShadows {
  static List<BoxShadow> get hard => [
    const BoxShadow(
      color: NeoColors.black,
      offset: Offset(6, 6),
      blurRadius: 0,
    ),
  ];
  static List<BoxShadow> get small => [
    const BoxShadow(
      color: NeoColors.black,
      offset: Offset(4, 4),
      blurRadius: 0,
    ),
  ];
}

class AppSpacing {
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
}

class AppRadius {
  static const double sm = 4.0;
  static const double md = 8.0;
  static const double lg = 12.0;
}
