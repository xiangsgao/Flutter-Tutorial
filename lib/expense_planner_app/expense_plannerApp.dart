import 'package:flutter/material.dart';
import 'widgets/home.dart';

class ExpensePlannerApp extends StatelessWidget {
  const ExpensePlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(titleMedium: TextStyle(fontSize: 20)),
          appBarTheme: AppBarTheme(titleTextStyle: TextStyle(fontSize: 20)),
          primarySwatch: Colors.purple
        ),
        title: "Expense Planner App",
        home: Home());
  }
}
