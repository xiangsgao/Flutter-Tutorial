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
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No transactions",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/images/test.jpg",
                  fit: BoxFit.cover,
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (buildContext, index) {
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor)),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Text(
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
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
                          DateFormat(DateFormat.MONTH_WEEKDAY_DAY)
                              .format(transactions[index].date),
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
