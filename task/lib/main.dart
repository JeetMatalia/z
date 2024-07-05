import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:elementthree/Screen/auth/login.dart';
import 'package:elementthree/Screen/auth/register.dart';
import 'package:elementthree/Screen/home/homeScreen.dart';
import 'package:elementthree/Screen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _router = GoRouter(
    observers: [BotToastNavigatorObserver()],
    // navigatorObservers: ,
    initialLocation: '/', // Initial route
    // errorPageBuilder: (context, state) => MaterialPage(child: ErrorPage()), // Error page
    routes: [
      // Define your routes here
      GoRoute(
        name: "splashScreen",
        path: '/',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        name:"register",
        path: '/register',
        builder: (context, state) => Register(),
      ),
      GoRoute(
        name: "login",
        path: '/login',
        builder: (context, state) => Login(),
      ),
      GoRoute(
        name: "home",
        path: '/home',
        builder: (context, state) => HomePage(),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),

      routerConfig: _router,
    );
  }
}
