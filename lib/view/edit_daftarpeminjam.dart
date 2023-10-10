// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pawn_book/controller/peminjam_controller.dart';
import 'package:pawn_book/model/peminjam_model.dart';
import 'package:pawn_book/view/Homepage.dart';

class EditPeminjam extends StatefulWidget {
  const EditPeminjam({
    Key? key,
    this.pid,
    this.namapeminjam,
    this.selectedBuku,
    this.pengarang,
    this.tglpinjam,
    this.tglkembali,
  }) : super(key: key);

  final String? pid;
  final String? namapeminjam;
  final String? selectedBuku;
  final String? pengarang;
  final String? tglpinjam;
  final String? tglkembali;

  @override
  State<EditPeminjam> createState() => _EditPeminjamState();
}

class _EditPeminjamState extends State<EditPeminjam> {
  String? enamapeminjam;
  String? eselectedBuku;
  String? epengarang;
  String? etglpinjam;
  String? etglkembali;

  Map<String, dynamic> pengarangBuku = {};

  var peminjamcontroller = PeminjamController();

  final TextEditingController newdatememinjam = TextEditingController();
  final TextEditingController newdatepengembalian = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    eselectedBuku = widget.selectedBuku;
    epengarang = widget.pengarang;
    newdatememinjam.text = widget.tglpinjam ?? '';
    newdatepengembalian.text = widget.tglkembali ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 209, 131, 102),
        title: Text(
          'Edit Data Daftar Peminjam',
          style: TextStyle(fontFamily: "ShortBaby"),
        ),
      ),
      backgroundColor: Colors.brown[100],
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(children: [
                // Widget untuk Nama Peminjam
                // ...

                // Widget untuk Judul Buku
                // ...

                // Widget untuk Tanggal Meminjam
                // ...

                // Widget untuk Tanggal Pengembalian
                // ...

                // Tombol Simpan
                // ...
              ]),
            ),
          ],
        ),
      )),
    );
  }
}
