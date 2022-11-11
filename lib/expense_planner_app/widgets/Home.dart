import 'package:flutter/material.dart';
import 'package:flutter_app/expense_planner_app/widgets/user_transaction/UserTransaction.dart';

class Home extends StatelessWidget {
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();

  Home({super.key});

  void startAddNewTransaction(BuildContext context){
    showMpda
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: IconButton(onPressed: () {}, icon: Icon(Icons.add))),
      appBar: AppBar(
        title: const Text("Flutter App"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: SingleChildScrollView(child: UserTransaction()),
    );
  }
}
