import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/Transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart(this.recentTransactions, {Key? key}) : super(key: key);

  List<Map<String, Object>> get GroupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double sum = 0;
      for (int i = 0; i < recentTransactions.length; i++) {
        final transaction = recentTransactions[i];
        if (transaction.date.day == weekDay.day &&
            transaction.date.month == weekDay.month &&
            transaction.date.year == weekDay.year) sum += transaction.amount;
      }
      return {"day": DateFormat.E().format(weekDay), 'amount': sum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          ...GroupTransactionValues.map((e) {
            return Card( child: Text("test"),);
          }).toList()
        ],
      ),
    );
  }
}
