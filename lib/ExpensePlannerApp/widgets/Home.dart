import 'package:flutter/material.dart';
import '../controller/HomeController.dart';
import '../models/Transaction.dart';

class Home extends StatelessWidget {
  late final HomeController homeController;
  final List<Transaction> transactions = [
    Transaction(id: 't1', amount: 23.3, date: DateTime.now(), title: "cpu"),
    Transaction(id: 't2', amount: 21.3, date: DateTime.now(), title: "gpu")
  ];

  Home({super.key}) {
    homeController = HomeController(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter App"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: const Card(
                  elevation: 5,
                  child: Text("chart"),
                ),
              ),
              Column(
                children: <Widget>[
                  ...transactions.map((e) {
                    return Card(
                        child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Text(
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                              e.amount.toString()),
                        ),
                        Column(
                          children: <Widget>[
                            Text(e.title),
                            Text(e.date.toString())
                          ],
                        )
                      ],
                    ));
                  }).toList(),
                ],
              )
            ]));
  }
}
