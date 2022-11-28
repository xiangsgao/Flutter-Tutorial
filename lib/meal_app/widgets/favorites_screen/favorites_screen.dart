
import 'package:flutter/material.dart';

// stateless widgets might be cached which means it might not have the updated values from parents
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("test"),);
  }
}
