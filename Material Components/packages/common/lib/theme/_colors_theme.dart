part of 'theme.dart';

abstract class _MainAppColors {
  static const Color primary = Color.fromRGBO(59, 182, 255, 1.0);
  static const Color secondary = Color(0xFFDEE3E8);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffFFFFFF);
  static const Color red = Color(0xffBE2845);
  static const Color outline = Color(0xFFDEE3E8);
  static const Color divider = Color(0xffB3B3B3);
}

const _colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: _MainAppColors.primary,
  onPrimary: _MainAppColors.black,
  secondary: _MainAppColors.secondary,
  onSecondary: _MainAppColors.black,
  error: _MainAppColors.red,
  onError: _MainAppColors.red,
  background: _MainAppColors.white,
  onBackground: _MainAppColors.black,
  surface: _MainAppColors.white,
  onSurface: _MainAppColors.black,
  outline: _MainAppColors.outline,
  tertiary: _MainAppColors.divider,
);
