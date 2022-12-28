import 'package:flutter/material.dart';
import 'package:flutter_app/shop_app/providers/orders.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const route = "/cart";

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      "\$${cart.totalAmount!}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: theme.primaryColor,
                  ),
                  TextButton(
                      onPressed: () {
                        final orders = Provider.of<Orders>(context, listen: false);
                        orders.addOrder(
                            cart.items.values.toList(), cart.totalAmount);
                        cart.clearCart();
                      },
                      child: const Text("ORDER NOW!"))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              final cartItems = cart.items.values.toList();
              final cartItemsKeys = cart.items.keys.toList();
              return CartIem(
                  id: cartItems[index].id,
                  price: cartItems[index].price,
                  quantity: cartItems[index].quantity,
                  title: cartItems[index].title,
                  productMapKey: cartItemsKeys[index]);
            },
            itemCount: cart.itemCount,
          ))
        ],
      ),
    );
  }
}
