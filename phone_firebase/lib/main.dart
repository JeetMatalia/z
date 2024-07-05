import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_firebase/screens/otp_screen.dart';
import 'package:phone_firebase/screens/phoneauth_screen.dart';

import 'firebase_options.dart';
import 'screens/homepage_screen.dart';

void main() async {
  // Initialize Firebase
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Run the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      title: 'Phone OTP',
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Text('Phone Auth'),
        ),
        body: OTPScreen(verificationid: '',)
      ),
    );
  }
}