import 'package:flutter/material.dart';
import 'package:flutter_app/shop_app/screens/home.dart';
import 'package:flutter_app/shop_app/screens/product_overview_screen.dart';

class ShopApp extends StatefulWidget {
  const ShopApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ShopAppState();
  }
}

class _ShopAppState extends State<ShopApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.purple, accentColor: Colors.deepOrange),
        home: ProductOverviewScreen());
  }
}
