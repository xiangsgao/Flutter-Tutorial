import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentTotal;

  const ChartBar(this.label, this.spendingAmount, this.spendingPercentTotal,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraint) {
      return Column(
        children: [
          Container(
              height: constraint.maxHeight * 0.15,
              child: FittedBox(
                  child: Text("\$${spendingAmount.toStringAsFixed(0)}"))),
          // shrinks the child instead of letting it grown when text overflows, more the text, tinier the text gets
          SizedBox(height: constraint.maxHeight * 0.05),
          Container(
            height: constraint.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      border: Border.all(color: Colors.grey, width: 1)),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPercentTotal,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: constraint.maxHeight * 0.05),
          Container(height: constraint.maxHeight * 0.15, child: Text(label))
        ],
      );
    });
  }
}
