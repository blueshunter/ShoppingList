import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/model/Item.dart';

class ShoppingListItem extends StatelessWidget {
  final Item _item;

  ShoppingListItem(this._item);

  @override
  Widget build(BuildContext context) {
    return new Text(_item.name);
  }

}