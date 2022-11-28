import 'package:flutter/material.dart';
import 'package:flutter_app/meal_app/widgets/main_drawer/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const ROUTE_NAME = "/filters";

  final void Function(Map<String, bool>) setFilter;

  const FiltersScreen({Key? key, required this.setFilter}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  Widget buildSwitchListTile(bool value, String title, String description, Function updateValue){
    return SwitchListTile(value: value, onChanged: updateValue as void Function(bool) , title: Text(title), subtitle: Text(description),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              widget.setFilter({
                'gluten': glutenFree,
                'vegan' : vegan,
                "vegetarian" : vegetarian,
                "lactose": lactoseFree
              });
            }, icon: const Icon(Icons.save))
          ],
          title: const Text("Filters"),
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text("Adjust your meal selection", style: Theme.of(context).textTheme.titleLarge,),
            ),
            Expanded(
                child: ListView(
              children: [
                buildSwitchListTile(glutenFree, "Gluten Free", "Shit stuff", (newValue){
                  setState(() {
                    glutenFree = newValue;
                  });
                }),
                buildSwitchListTile(lactoseFree, "Lactose Free", "Shit stuff", (newValue){
                  setState(() {
                    lactoseFree = newValue;
                  });
                }),
                buildSwitchListTile(vegetarian, "Vagina", "Shit stuff", (newValue){
                  setState(() {
                    vegetarian = newValue;
                  });
                }),
                buildSwitchListTile(vegan, "Vegan", "Shit stuff", (newValue){
                  setState(() {
                    vegan = newValue;
                  });
                })
              ],
            ))
          ],
        ));
  }
}
