import 'package:flutter/material.dart';

class ShopApp extends StatefulWidget{
  const ShopApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ShopAppState();
  }
}

class _ShopAppState extends State<ShopApp>{

  @override
  Widget build(BuildContext context){
    return MaterialApp(home: Scaffold(
        appBar: AppBar(title: const Text("Shop App")),
        body: Container()
    ));
  }
}