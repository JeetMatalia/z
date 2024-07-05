import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_firebase/screens/otp_screen.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Authentication"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
        
          children: [
            Image.asset("assets/img_phoneauth.png",height: 350,),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter Phone Number",
                    suffixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24))),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException ex) {},
                      codeSent: (String verificationid, int? resendtoken) {
                        print("object");
                        print(phoneController.text.toString());
        
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPScreen(verificationid: verificationid,)));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                      phoneNumber: "+91 ${phoneController.text.toString()}");
                },
                child: Text("Verify Phone Number"))
          ],
        ),
      ),
    );
  }
}
