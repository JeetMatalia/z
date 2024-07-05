import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      context.goNamed("login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'asset/image/splash.png',
        fit: BoxFit
            .cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,// Set the fit property to contain the image within the screen
      ),
    );
  }
}
