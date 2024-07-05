import 'package:common/widgets/buttons/mobile_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:mainapp/widgets/image_widget.dart';
import 'package:mainapp/widgets/title_widget.dart';
import 'widgets/button_widget.dart';
import 'package:common/theme/theme.dart';
import 'package:common/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).mainAppColors;// colors of mainAppColors app class in common package
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      title: 'My Profile',
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: colors.grey6D6,
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
      // home: Scaffold(
      //   body:
      //     MobilePrimaryButton(buttonText: 'click here', onTap: (){},)
      // ),
    );
  }
}




