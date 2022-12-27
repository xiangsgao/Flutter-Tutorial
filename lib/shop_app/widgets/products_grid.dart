import 'package:flutter/material.dart';
import 'package:flutter_app/shop_app/providers/products.dart';
import 'package:flutter_app/shop_app/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {

  final bool showFavorites;

  const ProductsGrid(this.showFavorites, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    final items = showFavorites ?  productsProvider.favoriteItems : productsProvider.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          final cur = items[index];
          return ChangeNotifierProvider.value(
              value: cur,
              child: const ProductItem());
        });
  }
}
