import 'package:flutter/material.dart';
import 'package:flutter_app/shop_app/providers/cart.dart';
import 'package:flutter_app/shop_app/screens/cart_screen.dart';
import 'package:flutter_app/shop_app/screens/home_screen.dart';
import 'package:flutter_app/shop_app/screens/product_details_screen.dart';
import 'package:flutter_app/shop_app/screens/product_overview_screen.dart';
import 'package:provider/provider.dart';

import 'providers/products.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        )
      ],
      child: MaterialApp(
          routes: {
            ProductDetailsScreen.routeName: (ctx) =>
                const ProductDetailsScreen(),
            CartScreen.route: (ctx) => const CartScreen()
          },
          theme: ThemeData(
              primarySwatch: Colors.purple, accentColor: Colors.deepOrange),
          home: const ProductOverviewScreen()),
    );
  }
}
