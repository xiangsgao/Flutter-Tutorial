import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function(String title, double amount, DateTime dataTime)
      addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? datePicked;

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: new DateTime(DateTime.now().year - 2),
            lastDate: DateTime.now())
        .then((date) {
      setState(() {
        if (date != null) datePicked = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                right: 10),
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
                Container(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(datePicked == null
                            ? "No Date Chosen"
                            : DateFormat.yMd().format(datePicked!)),
                      ),
                      TextButton(
                          onPressed: _showDatePicker,
                          child: Text(
                            "Choose Date",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isEmpty) return;
                    if (amountController.text.isEmpty) return;
                    if (datePicked == null) return;
                    widget.addNewTransaction(titleController.text,
                        double.parse(amountController.text), datePicked!);
                    Navigator.of(context)
                        .pop(); // close the top screen, modal sheet in this case
                  },
                  child: Text("Add Transaction"),
                ),
              ],
            ),
          )),
    );
  }
}
