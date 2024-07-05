import 'package:flutter/material.dart';

class ThankyouScreen extends StatefulWidget {
  const ThankyouScreen({super.key});

  @override
  State<ThankyouScreen> createState() => _ThankyouScreenState();
}

class _ThankyouScreenState extends State<ThankyouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add your image here
            Image.asset(
              'assets/images/img_thankyou.gif', // Specify the path to your image asset
              width: 400, // Adjust the width as needed
              height: 400, // Adjust the height as needed
            ),
            SizedBox(height: 20), // Optional: Add some spacing between the image and the text
            Text(
              'Thank you for your responce',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
                   ],
        ),
      ),
    );
  }
}
