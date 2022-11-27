import 'package:flutter/material.dart';
import 'package:flutter_app/meal_app/widgets/categories_screen/categories_screen.dart';
import 'package:flutter_app/meal_app/widgets/favorites_screen/favorites_screen.dart';
import 'package:flutter_app/meal_app/widgets/main_drawer/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  static const ROUTE_NAME = " /tabs";

  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> bottomNavigationBarWidgets = const [
    CategoriesScreen(),
    FavoritesScreen()
  ];

  int? bottomTabIndex;

  void _selectPage(int index) {
    setState(() {
      bottomTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: const MainDrawer(),
          appBar: AppBar(
            title: const Text("Meals"),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: "Categories",
                ),
                Tab(
                  text: "Favorites",
                  icon: Icon(Icons.star),
                )
              ],
            ),
          ),
          body: bottomTabIndex != null
              ? bottomNavigationBarWidgets[bottomTabIndex!]
              : const TabBarView(
                  children: [CategoriesScreen(), FavoritesScreen()],
                ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            currentIndex: bottomTabIndex != null ? bottomTabIndex! : 0,
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor!,
                  icon: const Icon(
                    Icons.category,
                  ),
                  label: "Categories"),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor!,
                  icon: const Icon(
                    Icons.star,
                  ),
                  label: "Favorites")
            ],
          ),
        ));
  }
}
