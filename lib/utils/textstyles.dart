import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class Textstyles {
  // Small Texts
  static const f12w400 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const f12w400white = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const f12w500 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  // Medium Texts
  static const f14w400 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const f14w500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const f14w400grey = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  // Large Texts
  static const f16w400 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const f16w600 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const f16w600white = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const f18w400 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static const f18w600 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  // Headings
  static const f20w400 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static const f20w600 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const f22w400 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );

  static const f22w600 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static const f24w400 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );

  static const f24w700 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  // Highlighted / Primary Text
  static const f16w500Primary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );

  static const f18w500Accent = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.accent,
  );

  // Disabled State Text
  static const f14w400Disabled = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.disabled,
  );
}
