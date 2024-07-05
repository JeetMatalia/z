import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part '_colors_theme.dart';

part '_theme_extensions.dart';

part '_dimension_themes.dart';

final lightTheme = ThemeData(
  fontFamily: 'Poppins',
  extensions: [
    // Dimensions(
    //   spaces: _spaceDimensions,
    //   insets: _insetsDimensions,
    //   borderWidths: _borderWidthDimensions,
    //   radii: _radiiDimensions,
    // ),
    myColorsExtension,
  ],
  appBarTheme: AppBarTheme(backgroundColor: _colorScheme.background),
  //scaffoldBackgroundColor: _colorScheme.background,
  // switchTheme: SwitchThemeData(
  //   thumbColor: MaterialStateProperty.resolveWith((states) =>
  //       states.contains(MaterialState.selected)
  //           ? Color(0xff00A0BF)
  //           : Colors.grey),
  //   trackColor: MaterialStateProperty.all(_colorScheme.tertiary),
  // ),
  // radioTheme: RadioThemeData(
  //   fillColor: MaterialStateProperty.resolveWith((states) =>
  //       states.contains(MaterialState.selected)
  //           ? Color(0xff00A0BF)
  //           : Colors.grey),
  // )
);
