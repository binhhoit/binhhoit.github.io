import 'package:flutter/material.dart';
import 'package:ui_kit/src/colors.dart';

/// Type scale (Inter font bundled in ui_kit).
class AppTextStyle {
  static TextStyle _base(double size, FontWeight weight, Color color, {double? height}) => TextStyle(
        fontFamily: 'inter',
        package: 'ui_kit',
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: height,
      );

  /// Large name in the page header.
  static TextStyle get display => _base(30, FontWeight.w800, UIColor.white, height: 1.2);

  /// Job title under the name.
  static TextStyle get headline => _base(16, FontWeight.w500, UIColor.textOnPrimary, height: 1.4);

  /// Section title.
  static TextStyle get h2 => _base(18, FontWeight.w700, UIColor.primary);

  /// Title inside a card (role, project name).
  static TextStyle get t1 => _base(15, FontWeight.w700, UIColor.normalText, height: 1.35);

  /// Secondary line (company, period).
  static TextStyle get t2 => _base(13, FontWeight.w500, UIColor.textMuted, height: 1.4);

  static TextStyle get body => _base(14, FontWeight.w400, UIColor.text2, height: 1.6);
  static TextStyle get small => _base(12, FontWeight.w400, UIColor.textFaint, height: 1.4);
  static TextStyle get chip => _base(12.5, FontWeight.w600, UIColor.text2);
  static TextStyle get button => _base(14, FontWeight.w600, UIColor.white);
  static TextStyle get link => _base(13, FontWeight.w600, UIColor.primary);
}
