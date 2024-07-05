import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions_model.dart';
import 'package:quiz_app/screens/home_screen.dart';
import './models/db_connect.dart';

void main() {
  var db = DBconnect();
  // db.addQuestion(Question(
  //     id: '20',
  //     options: {
  //       '5': false,
  //       '6': false,
  //       '4': true,
  //       '2': false,
  //     },
  //     title: 'What is 2+2 ?'));
  db.fetchQuestions();
  runApp(
    const MyApp(),
  );
}

//create MyApp widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
