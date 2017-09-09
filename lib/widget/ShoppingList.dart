import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/model/Item.dart';
import 'package:flutter_shopping_list/widget/ShoppingListItem.dart';

class ShoppingList extends StatelessWidget {

  final List<Item> _items;

  ShoppingList(this._items);

    @override
    Widget build(BuildContext context) {

      return new ListView.builder(
        padding: new EdgeInsets.all(8.0),
        itemExtent: 20.0,
        itemBuilder: (BuildContext context, int index) => new ShoppingListItem(_items[index]),
        itemCount: _items.length,
      );
    }
}