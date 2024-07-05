import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboard_screen/pages/thankyou_screen.dart';

import '../widgets/FeedBackMail.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController reviewController = TextEditingController();

  bool isValid(String s) {
    return s.trim().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Feedback"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/images/img_feedback.png"),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                ),

              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: mobileController,
              decoration: InputDecoration(
                labelText: 'Mobile',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: reviewController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Review',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (isValid(nameController.text) &&
                    isValid(mobileController.text) &&
                    isValid(emailController.text) &&
                    isValid(reviewController.text)) {
                  MailFeedback(
                    nameController.text,
                    mobileController.text,
                    emailController.text,
                    reviewController.text,
                  );
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ThankyouScreen()));
                } else {
                  // Handle invalid input
                  print('Invalid input');
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
