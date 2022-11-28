import 'package:flutter/material.dart';
import 'package:flutter_app/meal_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const ROUTE_NAME = "/meal-detail";

  const MealDetailScreen({Key? key}) : super(key: key);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(context).textTheme.titleLarge),
    );
  }

  Widget buildContainer(BuildContext context, Widget widget) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.grey)),
        height: 150,
        width: 300,
        child: widget);
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(meal.ingredient[index]),
                      ),
                    );
                  },
                  itemCount: meal.ingredient.length,
                )),
            buildSectionTitle(context, "Steps"),
            buildContainer(
                context,
                ListView.builder(
                  itemBuilder: (e, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(meal.steps[index]),
                          leading:
                              CircleAvatar(child: Text("# ${(index + 1)}")),
                        ),
                        const Divider()
                      ],
                    );
                  },
                  itemCount: meal.steps.length,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(meal);
        },
        child: const Icon(Icons.delete),
      ),
    );
  }
}
