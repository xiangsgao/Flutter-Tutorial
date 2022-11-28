import 'package:flutter/material.dart';
import 'package:flutter_app/meal_app/widgets/categories_screen/categories_screen.dart';
import 'package:flutter_app/meal_app/widgets/category_meal_screen/category_meal_screen.dart';
import 'package:flutter_app/meal_app/widgets/filters_screen/filters_screen.dart';
import 'package:flutter_app/meal_app/widgets/home_screen/home.dart';
import 'package:flutter_app/meal_app/widgets/meal_detail_screen/meal_detail_screen.dart';
import 'package:flutter_app/meal_app/widgets/tabs_screen/tabs_screen.dart';

class MealApp extends StatefulWidget {
  const MealApp({super.key});

  @override
  State<MealApp> createState() => _MealAppState();
}

class _MealAppState extends State<MealApp> {

  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian' : false,
  };

  void setFilters(Map<String, bool> filterData){
    setState(() {
      filters = filterData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: ThemeData.light().textTheme.copyWith(
                bodySmall:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodyMedium:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                titleLarge: const TextStyle(fontSize: 24),
                titleMedium: const TextStyle(fontSize: 20),
                titleSmall: const TextStyle(fontSize: 16),
              ),
          appBarTheme:
              const AppBarTheme(titleTextStyle: TextStyle(fontSize: 20)),
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1)),
      title: "Meal App",
      //home: const CategoriesScreen(),
      initialRoute: TabsScreen.ROUTE_NAME,
      routes: {
        Home.ROUTE_NAME: (context) => const Home(),
        CategoriesScreen.ROUTE_NAME: (ctx) => const CategoriesScreen(),
        CategoryMealsScreen.ROUTE_NAME: (ctx) => const CategoryMealsScreen(),
        MealDetailScreen.ROUTE_NAME: (ctx) => const MealDetailScreen(),
        TabsScreen.ROUTE_NAME: (ctx) => const TabsScreen(),
        FiltersScreen.ROUTE_NAME: (ctx) => FiltersScreen(setFilter: setFilters,)
      },
      // this is ran when no route is hit
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => const Home());
      },
      // this is hit when flutter fails to build a screen, this comes after onGenerateRoute
      onUnknownRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => const Home());
      },
    );
  }
}
