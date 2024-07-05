import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onboard_screen/pages/feedback_screen.dart';
import 'homepage_screen.dart';

class OTPScreen extends StatefulWidget {
  String verificationid;

  OTPScreen({Key? key, required this.verificationid}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("OTP Screen"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/img_otp.webp",
              height: 350,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: otpController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Enter The OTP",
                  suffixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential =
                  PhoneAuthProvider.credential(
                    verificationId: widget.verificationid,
                    smsCode: otpController.text.toString(),
                  );
                  await FirebaseAuth.instance
                      .signInWithCredential(credential)
                      .then((value) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => homepageScreen(title: ' '),
                      ),
                    );
                  });
                } catch (ex) {
                  log(ex.toString());
                  setState(() {
                    showError = true;
                  });
                }
              },
              child: Text("Check OTP"),
            ),
            if (showError)
              AlertDialog(
                title: Text("Invalid OTP"),
                content: Text("Please enter the correct OTP."),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        showError = false;
                      });
                    },
                    child: Text("OK"),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
