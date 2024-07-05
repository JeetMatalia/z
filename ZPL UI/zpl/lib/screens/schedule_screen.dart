import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cricket Schedule'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Day 1'),
              Tab(text: 'Day 2'),
              Tab(text: 'Day 3'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SchedulePage(day: 'Day 1', matchesCount: 8),
            SchedulePage(day: 'Day 2', matchesCount: 8),
            SchedulePage(day: 'Day 3', matchesCount: 8),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_cricket),
              label: 'Practice Matches',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer),
              label: 'Matches',
            ),
          ],
        ),
      ),
    );
  }
}

class SchedulePage extends StatelessWidget {
  final String day;
  final int matchesCount;

  const SchedulePage({required this.day, required this.matchesCount});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: matchesCount,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.flag), // Replace with team flag image
                SizedBox(width: 8.0),
                Text('Team A'),
              ],
            ),
            title: Text('Match ${index + 1}'),
            subtitle: Text('Day: $day'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Team B'),
                SizedBox(width: 8.0),
                Icon(Icons.flag), // Replace with team flag image
              ],
            ),
          ),
        );
      },
    );
  }
}
