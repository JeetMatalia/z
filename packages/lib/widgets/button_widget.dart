import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Icons.call, 'Call'),
          _buildButtonColumn(Icons.navigation, 'Route'),
          _buildButtonColumn(Icons.share, 'Share'),
        ],
      ),
    );
  }

  Column _buildButtonColumn(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        SizedBox(height: 8.0),
        Text(
          label,
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}