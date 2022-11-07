
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{

  final String _btnText;
  final void Function(String)? callback;

  const AnswerButton(this._btnText, {this.callback, super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      width: 100,
      child: ElevatedButton(
        style:
        ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 15,
            )
        ),
        onPressed: () => {
            callback!(_btnText)
        },
        child: Text(_btnText),
      ),
    );
  }
}