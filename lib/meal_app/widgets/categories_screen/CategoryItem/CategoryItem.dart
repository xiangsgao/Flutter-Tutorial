import 'package:flutter/material.dart';
import '../../category_meal_screen/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String categoryId;

  const CategoryItem({Key? key, required this.categoryId, required this.color, required this.title})
      : super(key: key);

  void selectCategory(BuildContext context){
    // Navigator.of(context).push(MaterialPageRoute(builder: (context){
    //   return CategoryMealsScreen(categoryTitle: title, categoryId: categoryId,);
    // }));
    Navigator.of(context).pushNamed(CategoryMealsScreen.ROUTE_NAME, arguments: {
      'id': categoryId,
      'title': title
    });
  }



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Text(title, style: Theme.of(context).textTheme.titleMedium,),
      ),
    );
  }
}
