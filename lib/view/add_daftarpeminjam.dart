import 'package:flutter/material.dart';

class AddPeminjam extends StatefulWidget {
  const AddPeminjam({super.key});

  @override
  State<AddPeminjam> createState() => _AddPeminjamState();
}

class _AddPeminjamState extends State<AddPeminjam> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Nama Peminjam :",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  margin: const EdgeInsets.only(right: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Masukan Nama Peminjam',
                      hintStyle: TextStyle(fontSize: 20),
                    ),
                    onSaved: (value) {
                      //name = value;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Judul Buku :",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  margin: const EdgeInsets.only(right: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Masukan Judul Buku',
                      hintStyle: TextStyle(fontSize: 20),
                    ),
                    onSaved: (value) {
                      //repassword = value;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Pengarang :",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  margin: const EdgeInsets.only(right: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Masukan Nama Pengarang',
                      hintStyle: TextStyle(fontSize: 20),
                    ),
                    onSaved: (value) {
                      //repassword = value;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Tanggal Meminjam :",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  margin: const EdgeInsets.only(right: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Masukan Tanggal Meminjam',
                      hintStyle: TextStyle(fontSize: 20),
                      prefixIcon: Icon(
                        Icons.date_range,
                        color: Colors.blue,
                      ),
                    ),
                    onSaved: (value) {
                      //email = value;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Tanggal Pengembalian :",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  margin: const EdgeInsets.only(right: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Masukan Tanggal Pengembalian',
                      hintStyle: TextStyle(fontSize: 20),
                      prefixIcon: Icon(
                        Icons.date_range_outlined,
                        color: Colors.blue,
                      ),
                    ),
                    onSaved: (value) {
                      //password = value;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80),
                        ),
                        minimumSize: const Size(350, 60)),
                    child: const Text(
                      "Simpan",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      )),
    );
  }
}
