

import 'package:flutter/material.dart';
import 'package:flutter_app/meal_app/widgets/categories_screen/categories_screen.dart';

class Home extends StatefulWidget {
  static const ROUTE_NAME = "/";

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _State();
}

class _State extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meal App"),),
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(CategoriesScreen.ROUTE_NAME);
          },
          child: const Text("Go to category meals"),
        ),
      ),
    );
  }
}
