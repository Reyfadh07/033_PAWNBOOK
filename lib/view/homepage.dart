import 'package:flutter/material.dart';
import 'package:pawn_book/view/widget/header.dart';
import 'package:pawn_book/view/widget/sidemenu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: header(context),
      body: SafeArea(child: Text('HomePage')),
    );
  }
}
