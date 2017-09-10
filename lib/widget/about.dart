import 'package:flutter/material.dart';

final textStyle = new TextStyle(color: Colors.black);

final Widget aboutTile = new AboutListTile(
    applicationName: "Shopping List",
    applicationIcon: new Icon(Icons.info),
    applicationVersion: '0.1',
    applicationLegalese: '© 2017 Thoretton Edwin',
    aboutBoxChildren: <Widget>[
      new Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: new RichText(
              text: new TextSpan(

                  children: <TextSpan>[
                    new TextSpan(
                        style: textStyle,
                        text: "This is simple Shopping list App"
                    ),
                    new TextSpan(
                        style: textStyle,
                        text: ".\n\nTo see the source code for this app, please visit the "
                    ),
                    new TextSpan(
                        style: textStyle,
                        text: 'github repo'

                    ),
                    new TextSpan(
                        style: textStyle,
                        text: "https://github.com/blueshunter/ShoppingList.git"
                    )
                  ]
              )
          )
      )
    ]
);