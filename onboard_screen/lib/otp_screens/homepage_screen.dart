import 'package:flutter/material.dart';
import 'package:onboard_screen/pages/feedback_screen.dart';

class homepageScreen extends StatelessWidget {
  const homepageScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add your image here
            Image.asset(
              'assets/images/img_homepage.jpeg', // Specify the path to your image asset
              width: 400, // Adjust the width as needed
              height: 400, // Adjust the height as needed
            ),
            SizedBox(height: 20), // Optional: Add some spacing between the image and the text
            Text(
              'Login Successfully!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FeedBack()));
            }, child: Text("Feedback"))
          ],
        ),
      ),
    );
  }
}
