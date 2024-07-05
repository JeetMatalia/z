import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'styles_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      // colors of the app
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primaryOpacity70,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      // card view theme
      cardTheme: const CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: 10.0),
      // App bar theme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.primary,
          elevation: 4.0,
          shadowColor: ColorManager.primaryOpacity70,
          titleTextStyle:
              getRegularStyle(color: ColorManager.white, fontSize: 14)),
      // Button theme
      buttonTheme: const ButtonThemeData(
          shape: StadiumBorder(),
          disabledColor: ColorManager.grey1,
          splashColor: ColorManager.primaryOpacity70,
          buttonColor: ColorManager.primary),
      // Elevated button
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(color: ColorManager.white),
              backgroundColor: ColorManager.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)))),
      // Text theme
      textTheme: TextTheme(
        headline1: getSemiBoldStyle(color: ColorManager.darkGrey),
        headline2: getMediumStyle(color: ColorManager.lightGrey, fontSize: 14),
        caption: getRegularStyle(color: ColorManager.grey),
        bodyText1: getRegularStyle(color: ColorManager.grey),
      ),

      // input decoration theme (text from field)
      inputDecorationTheme: InputDecorationTheme(
          // Content padding
          contentPadding: const EdgeInsets.all(8.0),
          // Hint style
          hintStyle: getRegularStyle(color: ColorManager.grey),
          // Label style
          labelStyle: getMediumStyle(color: ColorManager.lightGrey),
          // Error style
          errorStyle: getRegularStyle(color: ColorManager.error),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorManager.grey, width: 4.0),
              borderRadius: BorderRadius.circular(8.0)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorManager.primary, width: 4.0),
              borderRadius: BorderRadius.circular(4.0)),
          errorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorManager.error, width: 4.0),
              borderRadius: BorderRadius.circular(8.0))),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey));
}
