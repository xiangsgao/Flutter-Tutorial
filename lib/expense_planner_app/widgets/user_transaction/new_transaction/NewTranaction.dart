import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function(String title, double amount) addNewTransaction;

  NewTransaction(this.addNewTransaction);

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
                  onPressed: (){
                    addNewTransaction(titleController.text, double.parse(amountController.text));
                  },
                  child: Text("Add Transaction"),
                  style: TextButton.styleFrom(foregroundColor: Colors.red)),
            ],
          ),
        ));
  }
}
