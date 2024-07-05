import 'package:flutter/cupertino.dart';

class ImageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Image.asset(
        'assets/your_image.jpg',
        // Replace 'your_image.jpg' with your image path
        height: 450.0, // Adjust height as needed
        width: double.infinity, // Make the image take full width
        fit: BoxFit.fitWidth, // Cover the entire space
      ),
    );
  }
}