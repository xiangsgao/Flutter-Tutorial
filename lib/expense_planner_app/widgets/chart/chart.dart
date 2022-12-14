import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/transaction.dart';
import 'chart_bar//chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  final double appBarHeight;

  const Chart(this.recentTransactions, this.appBarHeight, {Key? key}) : super(key: key);

  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double sum = 0;
      for (int i = 0; i < recentTransactions.length; i++) {
        final transaction = recentTransactions[i];
        if (transaction.date.day == weekDay.day &&
            transaction.date.month == weekDay.month &&
            transaction.date.year == weekDay.year) sum += transaction.amount;
      }
      return {"day": DateFormat.E().format(weekDay).substring(0, 3).toUpperCase(), 'amount': sum};
    }).reversed.toList();
  }

  double get maxSpending{
    return groupTransactionValues.fold(0.0, (previousValue, element) {
      return previousValue + (element["amount"] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: (MediaQuery.of(context).size.height - appBarHeight - MediaQuery.of(context).padding.top) * 0.25,
      // margin: const EdgeInsets.only(top: 10),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...groupTransactionValues.map((e) {
                return Flexible(
                  fit: FlexFit.loose,
                    child: ChartBar(e["day"] as String, e["amount"] as double, maxSpending == 0 ? 0 :(e["amount"] as double) / maxSpending));
              }).toList()
            ],
          ),
        ),
      ),
    );
  }
}
