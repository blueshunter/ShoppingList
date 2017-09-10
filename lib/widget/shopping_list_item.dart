import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/model/Item.dart';
import 'package:flutter_shopping_list/model/check_item.dart';

// simple list item stateless widget (text)
/*
class ShoppingListItem extends StatelessWidget {
  final Item _item;

  ShoppingListItem(this._item);

  @override
  Widget build(BuildContext context) {
    return new Text(_item.name);
  }
}
*/

// list item with check box, callback and on tap gesture event
typedef void ShopingListItemChangedCallback(
    CheckItem checklistItem, bool value);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({
    Key key,
    this.animation,
    this.checklistItem,
    this.onTap,
    this.onCheckboxChanged,
  })
      : super(key: key) {
    assert(animation != null);
  }

  final Animation<double> animation;
  final CheckItem checklistItem;
  final VoidCallback onTap;
  final ShopingListItemChangedCallback onCheckboxChanged;

  @override
  Widget build(BuildContext context) {
    final cellContainer = new SizeTransition(
      axis: Axis.vertical,
      sizeFactor: animation,
      child: new Container(
        decoration: new BoxDecoration(
          border: new Border(
            bottom: new BorderSide(
              color: const Color(0xFFF4F4F4),
              width: 1.0,
            ),
          ),
        ),
        height: 60.0,
        child: new Stack(
          children: [
            new Material(
              color: const Color(0x00FFFFFF),
              child: new InkWell(
                highlightColor: Colors.grey.withAlpha(30),
                splashColor: Colors.grey.withAlpha(20),
                onTap: (() {
                  this.onTap();
                }),
              ),
            ),
            new Positioned(
              left: 0.0,
              top: 0.0,
              right: 10.0,
              bottom: 0.0,
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Checkbox(
                    value: checklistItem.isSelected,
                    onChanged: (bool value) {
                      onCheckboxChanged(checklistItem, value);
                    },
                  ),
                  new Expanded(
                    child: new IgnorePointer(
                      ignoring: true,
                      child: new Text(
                        checklistItem.title,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return cellContainer;
  }
}
