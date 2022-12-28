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

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((e) => e.isFavorite).toList();
  }

  void addProduct(Product product) {
    if (product.id == "") {
      product = Product(
          id: DateTime.now().toString(),
          title: product.title,
          price: product.price,
          description: product.description,
          imageUrl: product.imageUrl,
          isFavorite: product.isFavorite);
    }
    _items.add(product);
    notifyListeners();
  }

  void updateProduct(String id, Product product) {
    final index = _items.indexWhere((element) => element.id == id);
    if(index < 0) throw Exception("Product not found");
    _items[index] = Product(
        id: id,
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        isFavorite: product.isFavorite);
    notifyListeners();
  }

  Product? findById({String? id}) {
    if (id == null) return null;
    return _items.firstWhere((element) => element.id == id);
  }

  void deleteProduct(String id){
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
