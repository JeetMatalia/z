// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:quiz_app/constants.dart';
// import 'package:quiz_app/widgets/option_card.dart';
//
// import '../models/questions_model.dart';
// import '../widgets/question_widget.dart';
// import '../widgets/next_button.dart';
// import '../widgets/result_box.dart';
// import '../models/db_connect.dart';
//
// //create homescreen widget
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   //create an object for Dbconnect
//   var db = DBconnect();
//
//   // List<Question> _questions = [
//   //   Question(
//   //     id: '10',
//   //     options: {
//   //       '5': false,
//   //       '6': false,
//   //       '4': true,
//   //       '2': false,
//   //     },
//   //     title: 'What is 2 + 2 ?',
//   //   ),
//   //   Question(
//   //     id: '11',
//   //     options: {
//   //       '5': true,
//   //       '6': false,
//   //       '4': false,
//   //       '2': false,
//   //     },
//   //     title: 'What is 2 + 3 ?',
//   //   ),
//   // ];
//
//   //create an index to loop through _questions
//   late Future _questions;
//
//   Future<List<Question>> getData() async {
//     return db.fetchQuestions();
//   }
//
//   @override
//   void initState() {
//     _questions = getData();
//     super.initState();
//   }
//
//   //create an index to loop throught questions
//   int index = 0;
//
//   //create a score variable
//   int score = 0;
//
//   //create  a boolean to check user answer is correct or not
//   bool isPressed = false;
//
//   //create a function to display next question
//   bool isAlreadySelected = false;
//
//   //create for selection of option and change color
//   int selectedOption= -1;
//
//   void nextQuestion(int questionLength) {
//     if (index == questionLength - 1) {
//       //this is the block where the question end.
//       showDialog(
//         context: context,
//         barrierDismissible: false,
//         //this will disable the dissmiss function on clicking outside of box
//         builder: (ctx) => ResultBox(
//           result: score,
//           //total point user got
//           questionLength: questionLength,
//           onPressed: startOver, //out of how many questions
//         ),
//       );
//     } else {
//       if (isPressed) {
//         setState(() {
//           index++; //when the index will change to 1. rebuild the app.
//           isPressed = false;
//           isAlreadySelected = false;
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("Please select one option"),
//             behavior: SnackBarBehavior.floating,
//             margin: EdgeInsets.symmetric(vertical: 20.0),
//           ),
//         );
//       }
//     }
//   }
//
//   //create a function of changing the color
//   void checkAnswerAndUpdate(bool value) {
//     if (isAlreadySelected) {
//       return;
//     } else {
//       setState(() {
//         isPressed = true;
//         isAlreadySelected = true;
//       });
//
//       if (value == true) {
//         score++;
//       }
//     }
//   }
//
//   //create a function to start over
//   void startOver() {
//     setState(() {
//       index = 0;
//       score = 0;
//       isPressed = false;
//       isAlreadySelected = false;
//       selectedOption=-1;
//     });
//     Navigator.pop(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _questions as Future<List<Question>>,
//       builder: (ctx, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text('${snapshot.error}'),
//             );
//           } else if (snapshot.hasData) {
//             var extractedData = snapshot.data as List<Question>;
//             return Scaffold(
//               //change the background
//               backgroundColor: background,
//               appBar: AppBar(
//                 title: const Text('Quiz App'),
//                 backgroundColor: background,
//                 shadowColor: Colors.transparent,
//                 actions: [
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text(
//                       'Score: $score',
//                       style: const TextStyle(fontSize: 18.0),
//                     ),
//                   ),
//                 ],
//               ),
//               body: Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                 child: Column(
//                   children: [
//                     //add the question widget
//                     QuestionWidget(
//                       question: extractedData[index].title,
//                       //means a first question in a list
//                       indexAction: index,
//                       //currently at 0
//                       totalQuestions: extractedData.length,
//                       //total length of the list
//                     ),
//                     const Divider(color: neutral),
//                     //add some space
//                     const SizedBox(
//                       height: 25.0,
//                     ),
//                     for (int i = 0; i < extractedData[index].options.length; i++)
//                       GestureDetector(
//                         onTap: () {
//                           selectedOption=i;
//                           checkAnswerAndUpdate(
//                             extractedData[index].options.values.toList()[i],
//                           );},
//                         child: OptionCard(
//                           option: extractedData[index].options.keys.toList()[i],
//                           color: (isPressed && i==selectedOption)||extractedData[index].options.values.toList()[i]==true && isPressed
//                               ? extractedData[index].options.values.toList()[i] ==
//                               true
//                               ? correct
//                               : incorrect
//                               : neutral,
//                         ),
//                       )
//                   ],
//                 ),
//               ),
//
//               //use the floating action button
//               floatingActionButton: GestureDetector(
//                 onTap: () => nextQuestion(extractedData.length),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                   child: NextButton(
//
//                   ),
//                 ),
//               ),
//               floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerFloat,
//             );
//           }
//         } else {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         return const Center(child: Text('No Data'),);
//       },
//     );
//   }
// }
