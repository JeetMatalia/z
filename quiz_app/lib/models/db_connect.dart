import 'package:http/http.dart' as http;
import 'questions_model.dart';
import 'dart:convert';

class DBconnect {
  //let's first create a function to add a question to our database
  //declare the name of the table we want to create and add .json as suffix
  final url = Uri.parse(
      'https://simplequizapp-e69be-default-rtdb.firebaseio.com/questions.json');

  Future<void> addQuestion(Question question) async {
    http.post(url,
        body: json.encode({
          'title': question.title,
          'options': question.options,
        }));
  }

  //fetch the data from databse
  Future<List<Question>> fetchQuestions() async {
    //we got the data just using this.now let's print it to see what we got.
    return http.get(url).then((response) {
      //the 'then' method returns a 'response' which is our data.
      //to whats inside we have to decide to decode it  first.
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];
      data.forEach((key, value) {
        var newQuestion =
            Question(id: key, options: Map.castFrom(value['options']), title: value['title']);
        newQuestions.add(newQuestion);
      });
      // add to newQuestions

      return newQuestions;
    });
  }
}
