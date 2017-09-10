import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/widget/shopping_list_page.dart';
import 'package:flutter_shopping_list/theme.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new ShoppingListPage(),
      theme: appTheme,
      );
  }
}
