import "check_item.dart";

class CheckItemList {
  //constructor
  CheckItemList({List<CheckItem> items}) : this._items = items;

  // properties
  List<CheckItem> _items = <CheckItem>[];

  CheckItem operator [](int index) => _items[index];

  // methods
  List<CheckItem> items() {
    return _items;
  }

  void clear() {
    _items = <CheckItem>[];
  }

  void addItem(CheckItem item, {int index = -1}) {
    if (index == -1) {
      _items.add(item);
    } else {
      _items.insert(index, item);
    }
  }

  void removeItemAtIndex(int index) {
    _items.removeAt(index);
  }

  void removeItem(CheckItem item) {
    _items.remove(item);
  }
}
