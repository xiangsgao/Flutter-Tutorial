import 'package:flutter/material.dart';
import 'package:flutter_app/expense_planner_app/widgets/user_transaction/new_transaction/NewTranaction.dart';
import 'package:flutter_app/expense_planner_app/widgets/user_transaction/transaction_list/TransactionList.dart';

import '../../models/Transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  State createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> transactions = [
    Transaction(id: '1', amount: 23.3, date: DateTime.now(), title: "cpu"),
    Transaction(id: '2', amount: 21.3, date: DateTime.now(), title: "gpu")
  ];

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

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10),
            child: const Card(
              elevation: 5,
              child: Text("chart"),
            ),
          ),
          NewTransaction(_addNewTransaction),
          TransactionList(transactions)
        ]);
  }
}
