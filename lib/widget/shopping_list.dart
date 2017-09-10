import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/model/Item.dart';
import 'package:flutter_shopping_list/model/check_item_list.dart';
import 'package:flutter_shopping_list/model/check_item.dart';
import 'shopping_list_item.dart';

/*
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
*/

class ShoppingList extends StatefulWidget {

  //StatefulElement createElement() => new StatefulElement(this);
  @override
  _ShoppingListState createState() => new _ShoppingListState();
}

// Keeps a Checklist in sync with the AnimatedList that is used.
class AnimatedChecklist extends CheckItemList {

  AnimatedChecklist(
      {List<CheckItem> items, this.removedItemBuilder, this.listKey})
      : super(items: items);

  final dynamic removedItemBuilder;
  final GlobalKey<AnimatedListState> listKey;

  AnimatedListState get _animatedList => listKey.currentState;

  @override
  void addItem(CheckItem item, {int index = -1}) {
    super.addItem(item, index: index);
    if (index == -1) {
      _animatedList.insertItem(items.length);
    } else {
      _animatedList.insertItem(index);
    }
  }
}

//we create the state of pa
class _ShoppingListState extends State<ShoppingList>
    with TickerProviderStateMixin {

  final TextEditingController _controller = new TextEditingController();
  final GlobalKey<AnimatedListState> _listKey =
  new GlobalKey<AnimatedListState>();
  AnimatedChecklist _checklist;

  @override
  void initState() {
    super.initState();
    List<CheckItem> defaultItems = [
      new CheckItem(title: "tomates", isSelected: false),
      new CheckItem(title: "pain", isSelected: false),
    ];

    _checklist = new AnimatedChecklist(
      listKey: _listKey,
      items: defaultItems,
    );
  }

  // Used to build list items that haven't been removed.
  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return new ShoppingListItem(
      animation: animation,
      checklistItem: _checklist[index],
      onCheckboxChanged: (checklistItem, value) {
        setState(() {
          checklistItem.isSelected = value;
        });
      },
    );
  }

  Widget _buildInputField() {
    return new Container(
      color: const Color(0xFFF7F7F7),
      height: 60.0,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          new Material(
            color: new Color(0xFFF7F7F7),
            child: new IconButton(
              icon: new Icon(
                Icons.add,
                color: const Color(0xFF54C5F8),
              ),
              onPressed: () {
                if (_controller.text.length > 0) {
                  CheckItem item = new CheckItem(
                      title: _controller.text, isSelected: false);
                  setState(() {
                    _checklist.addItem(item, index: 0);
                    _controller.clear();
                  });
                }
              },
            ),
          ),
          new Expanded(
            child: new Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: new TextField(
                controller: _controller,
                decoration: new InputDecoration(
                  hintText: 'Enter your note',
                  hideDivider: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return new Expanded(
      child: new AnimatedList(
        key: _listKey,
        initialItemCount: _checklist.items().length,
        itemBuilder: _buildItem,
      ),
    );
  }

  Widget _contentWidget() {
    return new Column(
      children: [
        _buildInputField(),
        _buildListView(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: const Color(0xFFFFFFFF),
      child: _contentWidget(),
    );
  }
}
