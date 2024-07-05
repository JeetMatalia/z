import 'package:flutter/material.dart';
import 'package:material_ui_3/screens/communication.dart';
import 'package:material_ui_3/screens/containment.dart';
import 'package:material_ui_3/screens/navigation.dart';
import 'package:material_ui_3/screens/selection.dart';
import 'package:material_ui_3/screens/textInput.dart';
import '../screens/buttons.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Material UI 3'),
          backgroundColor: Colors.orange,
          bottom: const TabBar(isScrollable: true, tabs: [
            Tab(text: 'Buttons'),
            Tab(text:'Communication'),
            Tab(text:'Selection'),
            Tab(text:'Navigation'),
            Tab(text:'TextField'),
            Tab(text:'Containment'),
          ]),
        ),
        body: const TabBarView(
          children: [
            Buttons(),
            Communication(),
            Selection(),
            Navigation(),
            TextInput(),
            Containment(),
          ],
        ),
      ),
    );
  }
}
