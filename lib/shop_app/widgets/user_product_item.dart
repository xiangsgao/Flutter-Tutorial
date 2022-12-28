import 'package:flutter/material.dart';
import 'package:flutter_app/shop_app/screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String id;

  const UserProductItem({Key? key, required this.title, required this.imageUrl, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.route, arguments: id);
              },
              color: Theme.of(context).primaryColor,
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                final products = Provider.of<Products>(context, listen: false);
                products.deleteProduct(id);
              },
              color: Theme.of(context).errorColor,
              icon: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
