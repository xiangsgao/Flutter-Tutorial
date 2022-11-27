import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon) {
    return ListTile(
        onTap: () {},
        title: Text(title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        leading: Icon(
          icon,
          size: 26,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).colorScheme.secondary,
          child: Text(
            "Cooking up!",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor!,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildListTile("Meals", Icons.restaurant),
        buildListTile("Filters", Icons.settings)
      ]),
    );
  }
}
