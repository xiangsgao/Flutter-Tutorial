import 'package:flutter/material.dart';
import 'package:flutter_app/meal_app/mock_data.dart';
import 'package:flutter_app/meal_app/widgets/categories_screen/CategoryItem/CategoryItem.dart';

class CategoriesScreen extends StatelessWidget {
  static const ROUTE_NAME = "/category-list";

  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES.map((e) {
          return CategoryItem(
              categoryId: e.id,
              key: ValueKey(e.id),
              color: e.color,
              title: e.title);
        }).toList());
  }
}
