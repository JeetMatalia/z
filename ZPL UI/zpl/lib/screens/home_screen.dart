import 'package:flutter/material.dart';

import '../widgets/my_card.dart';

class MyHomePage extends StatelessWidget {
  final List<String> photoPaths = [
    'assets/dashboard/schedule.png',
    'assets/dashboard/venues.png',
    'assets/dashboard/teams.png',
    'assets/dashboard/history.png',
    'assets/dashboard/live_score.png',
    'assets/dashboard/highlights.png',
  ];

  final List<String> titles = [
    'Schedule',
    'Venue',
    'Teams',
    'History',
    'Live Score',
    'Highlights',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text('ZPL'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          // Cards
          Center(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(photoPaths.length, (index) {
                return MyCard(
                  photoPath: photoPaths[index],
                  title: titles[index],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
