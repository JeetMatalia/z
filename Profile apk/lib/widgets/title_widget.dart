import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: const Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jeet Matalia',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Mobile Application Devloper',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ],
            ),
          ),
          Icon(Icons.star),
          SizedBox(width: 8.0),
          Text('5'),
        ],
      ),
    );
  }
}