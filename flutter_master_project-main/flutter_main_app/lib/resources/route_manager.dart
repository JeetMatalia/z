import 'package:flutter/cupertino.dart';
import 'package:flutter_boiler_plate/ui/screens/home/home_screen.dart';
import 'package:flutter_boiler_plate/ui/screens/language/language_screen.dart';
import 'package:flutter_boiler_plate/ui/screens/login/login_screen.dart';
import 'package:flutter_boiler_plate/ui/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.id: (context) => const SplashScreen(),
  LoginScreen.id: (context) => const LoginScreen(),
  HomeScreen.id: (context) => const HomeScreen(),
  LanguageScreen.id: (context) => const LanguageScreen(),
};

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
