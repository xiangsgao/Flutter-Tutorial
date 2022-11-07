import 'package:flutter/material.dart';

import 'Quiz.dart';
import 'Result.dart';

class QuizApp extends StatefulWidget{
  const QuizApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp>{
  int _questionIndex = 0;
  int _score = 0;

  static const List<Map<String, Object>> _questions = [
    {"questionText": "Question 1", "answers": ["A", "B", "C"]},
    {"questionText": "Question 2", "answers": ["D", "E", "F"]},
    {"questionText": "Question 3", "answers": ["G", "H", "I"]},
  ];

  void _onAnswer(String test){
    setState(() {
      final answerScore = (_questions[_questionIndex]["answers"] as List<String>).indexOf(test) + 1;
      _score += answerScore;
      _questionIndex++;
    });
    print(test);
  }

  void _resetQuiz(){
    setState(() {
      _score = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: const Text("Hello World!")),
      body: _questionIndex < _questions.length ? Quiz(questionIndex: _questionIndex, onAnswer: _onAnswer, questions: _questions) : Result(_score, _resetQuiz)
    ));
  }
}