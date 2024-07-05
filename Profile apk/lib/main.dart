import 'package:apk1/widgets/image_widget.dart';
import 'package:apk1/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'widgets/button_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      title: 'My Profile',
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Text('My profile'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSection(),
            TitleSection(),
            ButtonSection(),
          ],
        ),
      ),
    );
  }
}




