import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boiler_plate/bloc/network_services.dart';
import 'package:flutter_boiler_plate/controller/controller.dart';
import 'package:flutter_boiler_plate/l10n/localization.dart';
import 'package:flutter_boiler_plate/resources/resources.dart';
import 'package:flutter_boiler_plate/ui/screens/splash/splash_screen.dart';
import 'package:flutter_boiler_plate/user_preferences/user_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'bloc/network_cubit.dart';
import 'package:provider/provider.dart' as prov;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? locale; // Local to set the local language to the application

  @override
  void initState() {
    super.initState();
    UserPreferences.getLocaleLanguageCode().then((value) => {
          setState(() {
            LocaleProvider().setLocale(locale = Locale(value));
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    var networkService = NetworkService();
    return MultiBlocProvider(
      providers: [
        BlocProvider<NetworkCubit>(
          create: (context) =>
              NetworkCubit(networkService: networkService, context: context),
        ),
      ],
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
          ],
          child: prov.ChangeNotifierProvider(
              create: (_) => LocaleProvider(),
              child: prov.Consumer<LocaleProvider>(
                builder: (context, model, child) {
                  return ScreenUtilInit(
                    minTextAdapt: false,
                    builder: (BuildContext context, Widget? child) {
                      return MaterialApp(
                        debugShowCheckedModeBanner: false,
                        onGenerateTitle: (context) =>
                            AppLocalizations.of(context)!.appName,
                        theme: ThemeData(
                          primarySwatch: Colors.blue,
                        ),
                        locale: model.locale ?? locale,
                        localizationsDelegates: const [
                          AppLocalizations.delegate,
                          GlobalMaterialLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                        ],
                        supportedLocales: L10n.all,
                        initialRoute: SplashScreen.id,
                        routes: routes,
                      );
                    },
                  );
                },
              ))),
    );
  }
}
