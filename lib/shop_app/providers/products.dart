import 'package:flutter/material.dart';

import 'product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
        id: "test",
        title: "product1",
        description: "super test",
        price: 2.23,
        imageUrl:
        "https://www.mountaingoatsoftware.com/uploads/blog/2016-09-06-what-is-a-product-quote.png",
        isFavorite: false)
  ];

  List<Product> get items{
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((e) => e.isFavorite).toList();
  }


  void addProduct(Product product){
    _items.add(product);
    notifyListeners();
  }

}