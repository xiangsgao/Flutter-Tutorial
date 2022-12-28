import 'package:flutter/material.dart';
import 'package:flutter_app/shop_app/providers/cart.dart';
import 'package:flutter_app/shop_app/providers/products.dart';
import 'package:flutter_app/shop_app/screens/cart_screen.dart';
import 'package:flutter_app/shop_app/widgets/app_drawer.dart';
import 'package:flutter_app/shop_app/widgets/badge.dart';
import 'package:provider/provider.dart';
import '../widgets/products_grid.dart';

enum FilterOptions { favorites, all }

class ProductOverviewScreen extends StatefulWidget {
  static const route = "/product-overview";
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selection) {
              setState(() {
                if (selection == FilterOptions.all) {
                  _showOnlyFavorites = false;
                } else {
                  _showOnlyFavorites = true;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) {
              return [
                const PopupMenuItem(
                  value: FilterOptions.favorites,
                  child: Text("Only Favorites"),
                ),
                const PopupMenuItem(
                  value: FilterOptions.all,
                  child: Text("Show All"),
                )
              ];
            },
          ),
          Consumer<Cart>(
              builder: (_, cart, badge) {
                return Badge(
                    value: cart.itemCount.toString(),
                    color: Colors.red,
                    child: badge!);
              },
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                   Navigator.of(context).pushNamed(CartScreen.route);
                },
              ))
        ],
        title: const Text("My shop"),
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
