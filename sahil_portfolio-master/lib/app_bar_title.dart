import 'package:flutter/material.dart';

import 'my_colors.dart';

class AppBarTitle extends StatelessWidget {
  final String text;

  AppBarTitle({
    required this.text,
    required bool hovered,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 14.0,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0,
              letterSpacing: 3.0,
              color: MyColors.clrwhite,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
