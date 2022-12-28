import 'package:flutter/material.dart';
import 'package:flutter_app/shop_app/providers/products.dart';
import 'package:flutter_app/shop_app/screens/edit_product_screen.dart';
import 'package:flutter_app/shop_app/widgets/app_drawer.dart';
import 'package:flutter_app/shop_app/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const route = "/user-product";
  const UserProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Products"),
        actions: [IconButton(onPressed: () {
          Navigator.of(context).pushNamed(EditProductScreen.route);
        }, icon: const Icon(Icons.add))],
      ),
      drawer: const AppDrawer(),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(itemBuilder: (ctx, index){
          final product = products.items[index];
          return Column(
            children: [
              UserProductItem(title: product.title, imageUrl: product.imageUrl, id: product.id,),
              const Divider()
            ],
          );
        }, itemCount: products.items.length,),
      ),
    );
  }
}
