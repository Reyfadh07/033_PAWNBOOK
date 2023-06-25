import 'package:flutter/material.dart';
import 'package:pawn_book/view/add_daftarpeminjam.dart';
import 'package:pawn_book/view/homepage.dart';
import 'package:pawn_book/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 250, 178, 152)),
        useMaterial3: true,
      ),
      home: AddPeminjam(),
    );
  }
}
