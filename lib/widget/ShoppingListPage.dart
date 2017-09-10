import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/widget/ShoppingList.dart';
import 'package:flutter_shopping_list/model/Item.dart';
import 'package:flutter_shopping_list/widget/about.dart';

class ShoppingListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
    drawer: aboutTile,
    appBar: new AppBar(
      title: new Text("ShoppingList"),
    ),
    body: new ShoppingList(items),
  );
  }
}
