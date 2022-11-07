import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget{
  final int score;
  final VoidCallback resetQuiz;
  const Result(this.score, this.resetQuiz, {super.key});

  String get resultText {
    return "Your score: $score";
  }

  @override
  Widget build(BuildContext context){
    return Center(child: Column(
      children: <Widget>[
        Text( resultText, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
        TextButton(style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20, ),
        ), onPressed: resetQuiz, child: const Text("Reset Quiz"))
      ],
    ));
  }
}