import 'package:flutter/material.dart';

AppBar header(context, {removeBackbutton = false}) {
  return AppBar(
    backgroundColor: Colors.brown[100],
    automaticallyImplyLeading: removeBackbutton ? false : true,
    leading: IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {},
    ),
  );
}
