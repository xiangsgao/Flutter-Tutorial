import 'package:flutter/material.dart';
import 'package:flutter_app/meal_app/models/meal.dart';

import '../../meal_detail_screen/meal_detail_screen.dart';

class MealItem extends StatefulWidget {
  final Meal meal;

  const MealItem({Key? key, required this.meal}) : super(key: key);

  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {

  bool deleted = false;

  void _removeMeal(Meal meal){
    setState(() {
      deleted = true;
    });
  }

  // if we want access context in init state, that is impossible since widget has not be init
  // use didChangeDependencies instead, this is run after each set state
  @override
  void didChangeDependencies(){
    final args = ModalRoute.of(context)?.settings.arguments;
    super.didChangeDependencies();
  }


  String get complexityText {
    switch (widget.meal.complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Hard:
        return "Hard";
      default:
        return "Don't know";
    }
  }

  String get affordabilityText {
    switch (widget.meal.affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Luxurious:
        return "Luxurious";
      case Affordability.Pricey:
        return "Pricey";
      default:
        return "Don't know";
    }
  }

  void selectMeal(BuildContext context) {
    final future = Navigator.of(context)
        .pushNamed(MealDetailScreen.ROUTE_NAME, arguments: widget.meal);
    future.then((deletedMeal){
      if(deletedMeal != null) {
        _removeMeal(deletedMeal as Meal);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if(deleted) {
      return const SizedBox.shrink();
    }
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    widget.meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 15,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    color: Colors.black54,
                    child: Text(
                      widget.meal.title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('${widget.meal.duration}'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.monetization_on),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
