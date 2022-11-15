import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/expense_planner_app/widgets/chart/chart.dart';
import 'package:flutter_app/expense_planner_app/widgets/user_transaction/new_transaction/new_tranaction.dart';
import 'package:flutter_app/expense_planner_app/widgets/user_transaction/transaction_list/transaction_list.dart';

import '../models/transaction.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();
  bool _showChart = true;

  final List<Transaction> transactions = [];

  void _addNewTransaction(String title, double amount, DateTime dateTime) {
    final transaction = Transaction(
        id: transactions.length.toString(),
        amount: amount,
        date: dateTime,
        title: title);
    setState(() {
      transactions.add(transaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      transactions.removeWhere((element) => element.id == id);
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

  List<Transaction> get _recentTransactions {
    final earliest = DateTime.now().subtract(const Duration(days: 7));
    return transactions.where((element) {
      return element.date.isAfter(earliest);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
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
    );

    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Platform.isIOS // if on ios then hide
            ? Container()
            : FloatingActionButton(
                onPressed: () => _startAddNewTransaction(context),
                child: IconButton(
                    onPressed: () => _startAddNewTransaction(context),
                    icon: Icon(Icons.add))),
        appBar: appBar,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (isLandscape)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Show chart"),
                    Switch.adaptive(
                        // make it ios friendly
                        value: _showChart,
                        onChanged: (val) {
                          setState(() {
                            _showChart = val;
                          });
                        }),
                  ],
                ),
              Chart(_recentTransactions, appBar.preferredSize.height),
              TransactionList(
                  transactions, _deleteTransaction, appBar.preferredSize.height)
            ]));
  }
}
