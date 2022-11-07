import 'package:flutter/cupertino.dart';

class Question extends StatelessWidget{
  final String _questionText;

  const Question(this._questionText, {super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child:
      Text(
        _questionText,
        style: const TextStyle(fontSize: 28, ),
        textAlign: TextAlign.center,
      ),
    );
  }

}