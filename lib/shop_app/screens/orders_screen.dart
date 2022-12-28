import 'package:flutter/material.dart';
import 'package:flutter_app/shop_app/providers/orders.dart' show Orders;
import 'package:flutter_app/shop_app/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const route = "/orders";
  
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Your Orders"),),
      drawer: const AppDrawer(),
      body: ListView.builder(itemCount: orders.orders.length,  itemBuilder: (ctx, index){
        return OrderItem(order: orders.orders[index]);
      }),
    );
  }
}
