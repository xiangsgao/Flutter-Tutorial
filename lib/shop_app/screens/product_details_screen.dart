import 'package:flutter/material.dart';
import 'package:flutter_app/shop_app/providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = "/product-detail";
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final product = Provider.of<Products>(context).items.firstWhere((element) => element.id == productId);
    return Scaffold(
      appBar: AppBar(title: Text(product.title),),
    );
  }
}
