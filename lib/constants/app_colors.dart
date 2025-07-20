import 'package:flutter/material.dart';

class AppColors {
  // Cores principais
  static const Color primaryBlue = Color(0xFF3B82F6);
  static const Color primaryPurple = Color(0xFF8B5CF6);

  // Cores de fundo
  static const Color darkBackground = Color(0xFF0D1117);
  static const Color lightBackground = Color(0xFFFFFFFF);

  // Cores de texto
  static const Color darkText = Color(0xFF1F2937);
  static const Color lightText = Color(0xFFF9FAFB);
  static const Color grayText = Color(0xFF6B7280);

  // Cores de destaque
  static const Color accent = primaryBlue;
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);

  // Gradientes
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryBlue, primaryPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [darkBackground, Color(0xFF1F2937)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
