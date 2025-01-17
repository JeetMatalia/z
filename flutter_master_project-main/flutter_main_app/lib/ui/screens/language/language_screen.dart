import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/controller/controller.dart';
import 'package:flutter_boiler_plate/model/responses/language.dart';
import 'package:flutter_boiler_plate/resources/color_manager.dart';
import 'package:flutter_boiler_plate/resources/resources.dart';
import 'package:flutter_boiler_plate/ui/screens/home/home_screen.dart';
import 'package:flutter_boiler_plate/user_preferences/user_preferences.dart';
import 'package:flutter_boiler_plate/utils/service_utilites.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  static const String id = 'LanguageScreen';

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String lngCode = '';

  @override
  void initState() {
    UserPreferences.getLocaleLanguageCode().then((value) => {
          setState(() {
            for (var element in ServiceUtils.languageList) {
              if (element.langCode == value) {
                element.isChecked = true;
              } else {
                element.isChecked = false;
              }
            }
            lngCode = value;
          })
        });
    super.initState();
  }

  Container saveLanguageButton({required void Function()? onPressed}) {
    return Container(
      height: 48.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(8.0)),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          AppLocalizations.of(context)!.saveLanguage,
          style: getBoldStyle(color: Colors.white, fontSize: 16.sp),
        ),
      ),
    );
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSizedBoxSpacer(),
              ServiceUtils().getHeaderWithBackArrowAndTitle(
                  context, AppLocalizations.of(context)!.selectLanguage, () {
                Navigator.pop(context);
              }, lngCode),
              buildSizedBoxSpacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: ServiceUtils.languageList.length,
                  itemBuilder: (BuildContext context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8.0),
                    child: LanguageItem(
                      language: ServiceUtils.languageList[index],
                      onClick: () async {
                        setState(() {
                          for (var element in ServiceUtils.languageList) {
                            element.isChecked = false;
                          }
                          ServiceUtils.languageList[index].isChecked = true;
                          if (ServiceUtils.languageList[index].isChecked =
                              true) {
                            selectedIndex = index;
                          }
                        });
                      },
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Consumer<LocaleProvider>(
                builder: (context, localeModel, child) =>
                    saveLanguageButton(onPressed: () {
                  setState(() {
                    localeModel.setLocale(Locale(
                        ServiceUtils.languageList[selectedIndex].langCode));
                    UserPreferences.setLocaleLanguageCode(
                        languageCode:
                            ServiceUtils.languageList[selectedIndex].langCode);
                  });
                  Navigator.pushNamedAndRemoveUntil(
                      context, HomeScreen.id, (route) => false);
                }),
              ),
              buildSizedBoxSpacer()
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageItem extends StatelessWidget {
  Language language;
  Function onClick;

  LanguageItem({Key? key, required this.language, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 28.w,
        ),
        height: 55.h,
        decoration: BoxDecoration(
          color: language.isChecked ? ColorManager.primary : Colors.grey,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 18.h,
              width: 30.w,
              child: Image.asset(
                language.image,
                filterQuality: FilterQuality.high,
              ),
            ),
            buildSizedBoxSpacer(),
            Text(
              language.name,
              style: getSemiBoldStyle(
                  color: language.isChecked ? ColorManager.white : Colors.black,
                  fontSize: 18.sp),
            ),
          ],
        ),
      ),
    );
  }
}

SizedBox buildSizedBoxSpacer() {
  return SizedBox(
    height: 15.h,
    width: 15.w,
  );
}
