import 'package:flutter/material.dart';
import 'widgets/Home.dart';

class ExpensePlannerApp extends StatelessWidget{
  const ExpensePlannerApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(home: Home());
  }
}
