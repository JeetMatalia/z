import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/model/responses/language.dart';
import 'package:flutter_boiler_plate/resources/resources.dart';
import 'package:flutter_boiler_plate/user_preferences/global_variables.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/api_constants.dart';

class ServiceUtils {
  static printLog(String msg) {
    if (APIConstants.isDebug) {
      print(msg);
    }
  }

  static showErrorMsg(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: getRegularStyle(fontSize: 16.sp, color: Colors.white),
      ),
      backgroundColor: Colors.grey.shade600,
      elevation: 0,
      duration: const Duration(seconds: 2),
    ));
  }

  static showSuccessMsg(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: getRegularStyle(fontSize: 16.sp, color: Colors.white),
      ),
      backgroundColor: Colors.black,
      elevation: 0,
      duration: const Duration(seconds: 2),
    ));
  }

  // languageList for Localization
  static List<Language> languageList = [
    Language(
        name: 'English',
        langCode: 'en',
        image: IconsAssets.englishIcon,
        isChecked: true),
    Language(
        name: 'Arabic',
        langCode: 'ar',
        image: IconsAssets.arabicIcon,
        isChecked: false)
  ];

  getHeaderWithBackArrowAndTitle(BuildContext context, String title,
      void Function() onBackClick, String lngCode) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: onBackClick,
          child: SizedBox(
            height: 21.h,
            width: 21.w,
            child: SvgPicture.asset(
              lngCode == LanguageCode.languageCodeArabic
                  ? IconsAssets.backMirrorArrowBlack
                  : IconsAssets.backArrowBlack,
              fit: BoxFit.fitHeight,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
          style: getSemiBoldStyle(
              fontSize: 18.sp, color: ColorManager.black),
        ),
      ],
    );
  }
}
