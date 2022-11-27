import 'package:flutter/material.dart';
import 'package:flutter_app/meal_app/mock_data.dart';
import 'package:flutter_app/meal_app/widgets/category_meal_screen/meal_item/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;
  static const ROUTE_NAME = "category-meal";

  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute
        .of(context)!
        .settings
        .arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final meal = DUMMY_CATEGORIES.where((element) =>
        element.id == categoryId
    ).first;

    final recipes = meal.recipes;


    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(itemBuilder: (context, index) {
          return MealItem(meal: recipes[index]);
        }, itemCount: recipes.length,));
  }
}
