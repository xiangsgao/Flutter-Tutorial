import 'package:flutter/material.dart';
import 'package:flutter_app/expense_planner_app/widgets/home.dart';

class ExpensePlannerApp extends StatelessWidget {
  const ExpensePlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(titleMedium: TextStyle(fontSize: 20)),
          appBarTheme: AppBarTheme(titleTextStyle: TextStyle(fontSize: 20)),
          primarySwatch: Colors.blue
        ),
        title: "Expense Planner App",
        home: Home());
  }
}
