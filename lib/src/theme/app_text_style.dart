import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

/// Fixed, design-driven text styles used across feature screens.
///
/// Font sizes use `.sp` (flutter_screenutil) so they scale with the device,
/// which makes the styles runtime values — hence getters, not `const`.
/// For general content, prefer the theme typescale via `context.textTheme`.
class AppTextStyle {
  AppTextStyle._();

  static const String _fontFamily = 'Poppins';

  /// Screen/hero title, e.g. "Sky Roof Restaurant" (26 · w800).
  /// Poppins Medium 18 / line-height 22 (black). Align via the Text widget.
  static TextStyle get blackW500Size18 => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        height: 22 / 18, // line-height 22px
        letterSpacing: 0,
        color: AppColors.black,
      );
  static TextStyle get blackW400Size16 => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    height: 22 / 18, // line-height 22px
    letterSpacing: 0,
    color: AppColors.black,
  );

  /// Section heading, e.g. "About" (22 · w800).
  static TextStyle get sectionTitle => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 22.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.textDark,
      );

  /// Reading/body copy (17 · w400 · 1.5 line height).
  static TextStyle get body => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 17.sp,
        height: 1.5,
        fontWeight: FontWeight.w400,
        color: AppColors.textDark,
      );

  /// Muted subtitle / location line (17 · w500 · gray).
  static TextStyle get subtitle => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textGray,
      );

  /// Inactive tab label (18 · w500 · gray).
  static TextStyle get tab => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
      );

  /// Active tab label (18 · w700 · primary).
  static TextStyle get tabActive => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
      );

  /// Price pill text over media (14 · w600 · white).
  static TextStyle get whiteW500Size14 => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      );
  static TextStyle get whiteW400Size14 => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static TextStyle get blackW500Size17 => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 17.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static TextStyle get blackW500Size14 => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static TextStyle get blackW400Size14 => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
  static TextStyle get blackW400Size12 => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
  static TextStyle get greyW500Size12 => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.greyPerson,
  );

  /// Poppins Regular 14 / line-height 100% (#666666). Align at the widget.
  static TextStyle get grey400Size14 => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        height: 1, // line-height 100%
        letterSpacing: 0,
        color: AppColors.grey,
      );

  /// Rating badge value, e.g. "9.5" (15 · w700 · white).
  static TextStyle get rating => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      );

  /// "+N" overlay on the last gallery thumbnail (16 · w700 · white).
  static TextStyle get thumbnailOverlay => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      );

  /// Inline text link, e.g. "See more" (17 · w600 · primary).
  static TextStyle get link => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 17.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      );

  /// Poppins Medium 9 / line-height 9 (primary). Caption under an icon.
  static TextStyle get primaryW500Size9 => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 9.sp,
        fontWeight: FontWeight.w500,
        height: 1, // line-height 9px
        letterSpacing: 0,
        color: AppColors.primary,
      );

  /// Primary button label, e.g. "Book Table" (19 · w700 · white).
  static TextStyle get whiteW500Size16 => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      );
}
