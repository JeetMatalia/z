import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {super.key,
      required this.question,
      required this.indexAction,
      required this.totalQuestions});

  //here we need the  question title and the total number of the questions, and also the index
  final String question;
  final int indexAction;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Center(
        child: Column(
          children: [
            Text(
              'Questions ${indexAction + 1}/ $totalQuestions',
              style: const TextStyle(
                fontSize: 20.0,
                color: neutral,
              ),
            ),
            Text(
              '$question',
              style: const TextStyle(
                fontSize: 24.0,
                color: neutral,
              ),
            )
          ],
        ),
      ),
    );
  }
}
