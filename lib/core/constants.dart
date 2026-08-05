import 'package:flutter/material.dart';

class AppConstants {
  static const String baseUrl = 'http://192.168.1.7:8081/api/v1';
  static const String jwtKey = 'safara_jwt_token';
  
  static const String seedUserId = 'c7133c5e-c490-4011-8941-a866dc9adbdd';
  static const String seedLocationId = 'f886cd8f-a0bb-4787-9459-c49d2ea84c4f';
}

class AppColors {
  static const Color primary = Color(0xFF2563EB);
  static const Color primaryDark = Color(0xFF1D4ED8);
  static const Color primaryLight = Color(0xFF3B82F6);
  
  static const Color green = Color(0xFF10B981);
  static const Color yellow = Color(0xFFF59E0B);
  static const Color orange = Color(0xFFF97316);
  static const Color red = Color(0xFFEF4444);
  
  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Colors.white;
  static const Color cardBackground = Color(0xFFFFFFFF);
  
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textTertiary = Color(0xFF94A3B8);
  
  static const Color border = Color(0xFFE2E8F0);
  static const Color divider = Color(0xFFF1F5F9);
  
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  
  static const Color shadow = Color(0x1A000000);
}

class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double xxxl = 32.0;
}

class AppBorderRadius {
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double full = 9999.0;
}

class AppShadows {
  static List<BoxShadow> get card => [
    BoxShadow(
      color: AppColors.shadow,
      blurRadius: 10,
      offset: const Offset(0, 4),
      spreadRadius: 0,
    ),
  ];
}
