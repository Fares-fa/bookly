import 'package:flutter/material.dart';

/// Fixed brand palette pulled from the design mockups.
///
/// These are literal, non-themed colors (they do not change with
/// light/dark mode). For semantic colors that adapt to the theme, use
/// `context.appColors` ([AppColorsExtension]) or `context.colors`
/// ([ColorScheme]) instead.
class AppColors {
  AppColors._();

  static const background = Color(0xFFF0F8FF); // AliceBlue page bg
  static const primary = Color(0xFF1B3FD8); // royal blue (CTA, badge, tab)
  static const textDark = Color(0xFF15243B); // titles
  static const textGray = Color(0xFF8B95A7); // subtitles / inactive tabs
  static const star = Color(0xFFFFC107); // rating star
  static const menuBg = Color(0x4D2563EB); // primary-30 (#2563EB4D) — menu button circle
  static const divider = Color(0xFFE1E9F5); // hairline separators
  static const favorite = Color(0xFFFF5252); // active favorite heart (redAccent)
  static const scrim = Color(0x6E000000); // #0000006E — 43% black controls over media
  static const scrimStrong = Color(0x90000000); // #00000080 — 50% black image overlays
  static const greyPerson = Color(0xFFB6B6B6);
  static const grey = Color(0xFF666666); // #666666

  static const black = Colors.black;
  static const white = Colors.white;
}
