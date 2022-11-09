import 'package:flutter/cupertino.dart';
import 'package:flutter_app/QuizApp/widgets/AnswerButton.dart';
import 'package:flutter_app/QuizApp/widgets/Question.dart';

class Quiz extends StatelessWidget{
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final void Function(String) onAnswer;

  const Quiz({required this.questions, required this.onAnswer, required this.questionIndex, super.key});
  @override
  Widget build(BuildContext context){
    return Column(children: <Widget>[
      Question(questions[questionIndex]['questionText'] as String),
      ...(questions[questionIndex]["answers"] as List<String>).map((e) {
        return AnswerButton(e, callback: onAnswer);
      }).toList()
    ]);
  }

}