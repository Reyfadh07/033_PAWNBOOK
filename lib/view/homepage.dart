import 'package:flutter/material.dart';
import 'package:pawn_book/view/sidemenu.dart';
import 'package:pawn_book/view/widget/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context),
    );
  }
}
