import 'package:flutter/material.dart';
import 'package:flutter_app/expense_planner_app/widgets/Chart/Chart.dart';
import 'package:flutter_app/expense_planner_app/widgets/user_transaction/new_transaction/NewTranaction.dart';
import 'package:flutter_app/expense_planner_app/widgets/user_transaction/transaction_list/TransactionList.dart';

import '../models/Transaction.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();

  final List<Transaction> transactions = [];

  void _addNewTransaction(String title, double amount) {
    final transaction = Transaction(
        id: transactions.length.toString(),
        amount: amount,
        date: DateTime.now(),
        title: title);
    setState(() {
      transactions.add(transaction);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bCtx) {
          return GestureDetector(
            // use gesture detector to avoid sheet closed when on tab inside the sheet
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
          );
        });
  }

  List<Transaction> get _recentTransactions{
    final earliest = DateTime.now().subtract(const Duration(days: 7));
    return transactions.where((element) {
        return element.date.isAfter(earliest);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddNewTransaction(context),
          child: IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(Icons.add))),
      appBar: AppBar(
        title: Container(
            width: double.infinity,
            child: Text(
              "Expense Planner App",
              style: Theme.of(context).appBarTheme.titleTextStyle,
            )),
        actions: [
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              child: Chart(_recentTransactions)
            ),
            TransactionList(transactions)
          ])),
    );
  }
}
