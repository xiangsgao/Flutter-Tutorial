import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function(String title, double amount) addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: "Title"),
              ),
              TextField(
                  keyboardType: TextInputType.number,
                  controller: amountController,
                  decoration: InputDecoration(labelText: "Amount")),
              TextButton(
                  onPressed: () {
                    widget.addNewTransaction(titleController.text,
                        double.parse(amountController.text));
                    Navigator.of(context).pop(); // close the top screen, modal sheet in this case
                  },
                  child: Text("Add Transaction"),
                  style: TextButton.styleFrom(foregroundColor: Colors.red)),
            ],
          ),
        ));
  }
}
