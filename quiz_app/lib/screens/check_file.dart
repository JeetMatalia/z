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
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   var db = DBconnect();
//   late Future _questions;
//   int index = 0;
//   int score = 0;
//   bool isPressed = false;
//   bool isAlreadySelected = false;
//   int selectedOption = -1;
//   String correctAnswerMessage = '';
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
//   void nextQuestion(int questionLength) {
//     if (index == questionLength - 1) {
//       showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (ctx) => ResultBox(
//           result: score,
//           questionLength: questionLength,
//           onPressed: startOver,
//         ),
//       );
//     } else {
//       if (isPressed) {
//         setState(() {
//           index++;
//           isPressed = false;
//           isAlreadySelected = false;
//           correctAnswerMessage = ''; // Reset correct answer message
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
//   void checkAnswerAndUpdate(bool value, int index) {
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
//       } else {
//         // Set the correct answer message
//       }
//     }
//   }
//
//   void startOver() {
//     setState(() {
//       index = 0;
//       score = 0;
//       isPressed = false;
//       isAlreadySelected = false;
//       selectedOption = -1;
//       correctAnswerMessage = '';
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
//               backgroundColor: background,
//               appBar: AppBar(
//                 title: const Text('Quiz App'
//                   ,
//                   style: TextStyle(color: Colors.orangeAccent),),
//                 backgroundColor: background,
//                 shadowColor: Colors.transparent,
//                 actions: [
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text(
//                       'Score: $score',
//                       style: const TextStyle(fontSize: 18.0, color: correct),
//                     ),
//                   ),
//                 ],
//               ),
//               body: Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                 child: Column(
//                   children: [
//                     QuestionWidget(
//                       question: extractedData[index].title,
//                       indexAction: index,
//                       totalQuestions: extractedData.length,
//                     ),
//                     const Divider(color: neutral),
//                     const SizedBox(
//                       height: 25.0,
//                     ),
//                     for (int i = 0;
//                     i < extractedData[index].options.length;
//                     i++)
//                       GestureDetector(
//                         onTap: () {
//                           selectedOption = i;
//                           checkAnswerAndUpdate(
//                             extractedData[index].options.values.toList()[i],
//                             index,
//                           );
//                         },
//                         child: OptionCard(
//                           option: extractedData[index].options.keys.toList()[i],
//                           color: (isPressed && i == selectedOption) ||
//                               (extractedData[index]
//                                   .options
//                                   .values
//                                   .toList()[i] ==
//                                   true &&
//                                   isPressed)
//                               ? extractedData[index]
//                               .options
//                               .values
//                               .toList()[i] ==
//                               true
//                               ? correct
//                               : incorrect
//                               : neutral,
//                         ),
//                       )
//                   ],
//                 ),
//               ),
//               floatingActionButton: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   if ("Correct answer is: ${extractedData[index].options.keys.firstWhere((key) => extractedData[index].options[key] == true)}"
//                       .isNotEmpty &&
//                       isPressed)
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         "Correct answer is: ${extractedData[index].options.keys.firstWhere((key) => extractedData[index].options[key] == true)}",
//                         style: TextStyle(color: correct, fontSize: 20.0),
//                       ),
//                     ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   GestureDetector(
//                     onTap: () => nextQuestion(extractedData.length),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                       child: NextButton(
//                         buttonText: 'Next',
//                       ),
//                     ),
//                   ),
//                 ],
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
//         return const Center(
//           child: Text('No Data'),
//         );
//       },
//     );
//   }
// }
