import 'package:flutter/material.dart';
import 'package:flutter_app/shop_app/model/product.dart';
import 'package:flutter_app/shop_app/widgets/product_item.dart';

class ProductOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = [
    Product(
        id: "test",
        title: "product1",
        description: "super test",
        price: 2.23,
        imageUrl:
            "https://www.mountaingoatsoftware.com/uploads/blog/2016-09-06-what-is-a-product-quote.png",
        isFavorite: false)
  ];

  ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My shop"),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: loadedProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
          ),
          itemBuilder: (context, index) {
            final cur = loadedProducts[index];
            return ProductItem(imageUrl: cur.imageUrl, title: cur.title, id: cur.id);
          }),
    );
  }
}
