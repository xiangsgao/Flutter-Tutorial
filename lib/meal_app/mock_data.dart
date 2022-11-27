import 'package:flutter_app/meal_app/models/meal.dart';

import 'models/Category.dart';
import 'package:flutter/material.dart';
const DUMMY_CATEGORIES = [
  Category(id: "1", title: "test", color: Colors.purple, recipes: [
    Meal(id: "1", imageUrl: "https://kutv.com/resources/media/6b7a7c7c-3c44-489c-9880-4a17508cdc6d-large16x9_Postworkout_meal.jpg?1577802416711", categories: ["1", "2"], title: "test meal", ingredient: ["apple", "orange"], duration: 10, complexity: Complexity.Hard, steps: ["eat orange", "buy apple"], affordability: Affordability.Affordable, isGlutenFree: true, isLactoseFree: false, isVegan: true, isVegetarian: true)
  ]),
  Category(id: "2", title: "test2", color: Colors.orange, recipes: []),
  Category(id: "3", title: "test3", color: Colors.green, recipes: []),
  Category(id: "4", title: "test4", color: Colors.yellow, recipes: []),
  Category(id: "5", title: "test5", color: Colors.purple, recipes: []),
  Category(id: "6", title: "test6", color: Colors.orange, recipes: []),
  Category(id: "7", title: "test7", color: Colors.green, recipes: []),
  Category(id: "8", title: "test8", color: Colors.yellow, recipes: []),
  Category(id: "9", title: "test9", color: Colors.purple, recipes: []),
  Category(id: "10", title: "test10", color: Colors.orange, recipes: []),
  Category(id: "11", title: "test11", color: Colors.green, recipes: []),
  Category(id: "2", title: "test12", color: Colors.yellow, recipes: []),
];