import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'home_page.dart';
import 'my_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyBpZWBt5MDkaRJXbN6TqLOpAWH6T4l6wAo",
    projectId: "sahil-portfolio-4f3f4",
    messagingSenderId: "949077349891",
    appId: "1:949077349891:web:bb31a83c3d0858455ea036",
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final scrollbarTheme = ScrollbarThemeData(
    thumbColor: MaterialStateProperty.all<Color>(MyColors.clr2),
    trackColor: MaterialStateProperty.all<Color>(Colors.grey),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Jeet's Portfolio",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scrollbarTheme: scrollbarTheme,
      ),
      home: HomePage(),
      // FutureBuilder(
      //   future: _initialization,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) {
      //       return const Scaffold(
      //         body: Center(
      //           child: Text("Error"),
      //         ),
      //       );
      //     }
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       return HomePage();
      //     }
      //     return const Scaffold(
      //       body: Center(
      //         child: CircularProgressIndicator(),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
