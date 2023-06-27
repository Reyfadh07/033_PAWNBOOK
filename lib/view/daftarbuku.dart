import 'package:flutter/material.dart';
import 'package:pawn_book/view/add_daftarbuku.dart';
import 'package:pawn_book/view/widget/header.dart';
import 'package:pawn_book/view/widget/sidemenu.dart';

class DaftarBuku extends StatefulWidget {
  const DaftarBuku({super.key});

  @override
  State<DaftarBuku> createState() => _DaftarBukuState();
}

class _DaftarBukuState extends State<DaftarBuku> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: header(context),
      body: SafeArea(
        child: Text('Daftar Buku'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddBuku(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
