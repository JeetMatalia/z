import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/l10n/localization.dart';
import 'package:flutter_boiler_plate/ui/screens/language/language_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_assets/my_assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  static const String id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyAssets.images.splashLogo.image(),
              Text(
                AppLocalizations.of(context)!.welcome,
                style: const TextStyle(fontSize: 20, color: Colors.blue),
              ),
              SizedBox(
                height: 10.h,
              ),
              OutlinedButton(
                  onPressed: _changeLanguage,
                  child: Text(AppLocalizations.of(context)!.selectLanguage,
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black)))
            ],
          ),
        ),
      ),
    );
  }

  void _changeLanguage() {
    Navigator.pushNamed(context, LanguageScreen.id, arguments: (route) => null);
  }
}
