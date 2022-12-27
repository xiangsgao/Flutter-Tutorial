import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartIem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;
  final String productMapKey;

  const CartIem(
      {Key? key,
      required this.id,
      required this.price,
      required this.quantity,
      required this.productMapKey,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        final cart = Provider.of<Cart>(context, listen: false);
        cart.removeItem(productMapKey);
      },
      background: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          alignment: Alignment.centerRight,
          color: Theme.of(context).errorColor,
          padding: const EdgeInsets.only(right: 20),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          )),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(title),
            subtitle: Text("Total: \$${price * quantity}"),
            trailing: Text("$quantity X"),
            leading: CircleAvatar(
              child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: FittedBox(child: Text("\$$price"))),
            ),
          ),
        ),
      ),
    );
  }
}
