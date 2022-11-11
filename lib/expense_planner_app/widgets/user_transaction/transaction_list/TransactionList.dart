import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (buildContext, index) {
          return Card(
              child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    "\$${transactions[index].amount}"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                      transactions[index].titleUpperCase),
                  Text(
                    DateFormat(DateFormat.MONTH_WEEKDAY_DAY).format(transactions[index].date),
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ));
        },
        itemCount: transactions.length,
      ),
    );
  }
}
