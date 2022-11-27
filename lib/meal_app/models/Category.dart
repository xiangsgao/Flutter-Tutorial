import 'package:flutter/material.dart';
import 'package:flutter_app/meal_app/models/meal.dart';

class Category{
  final String id;
  final String title;
  final Color color;
  final List<Meal> recipes;

  const Category({required this.id,  required this.title, required this.color, required this.recipes});

}