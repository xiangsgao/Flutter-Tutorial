import 'package:flutter/material.dart';
import 'package:flutter_app/shop_app/screens/home_screen.dart';
import 'package:flutter_app/shop_app/screens/orders_screen.dart';
import 'package:flutter_app/shop_app/screens/product_overview_screen.dart';

import '../screens/user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text("Hello Friend!"),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ProductOverviewScreen.route);
            },
            leading: const Icon(Icons.shop),
            title: const Text("Shop"),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrdersScreen.route);
            },
            leading: const Icon(Icons.payment),
            title: const Text("Orders"),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(UserProductsScreen.route);
            },
            leading: const Icon(Icons.edit),
            title: const Text("Manage Products"),
          )
        ],
      ),
    );
  }
}
