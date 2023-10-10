import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pawn_book/controller/buku_controller.dart';
import 'package:pawn_book/view/add_daftarbuku.dart';
import 'package:pawn_book/view/edit_daftarbuku.dart';
import 'package:pawn_book/view/widget/header.dart';
import 'package:pawn_book/view/widget/sidemenu.dart';

class DaftarBuku extends StatefulWidget {
  const DaftarBuku({super.key});

  @override
  State<DaftarBuku> createState() => _DaftarBukuState();
}

class _DaftarBukuState extends State<DaftarBuku> {
  var bc = BukuController(); /// Instance dari BukuController

  @override
  void initState() {
    bc.getBuku(); /// Memanggil metode untuk mendapatkan daftar buku
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      drawer: SideMenu(), /// Menampilkan menu samping
      appBar: header(context), /// Menampilkan header aplikasi
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Daftar Buku",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: StreamBuilder<List<DocumentSnapshot>>(
                stream: bc.stream, /// Menggunakan stream dari BukuController
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final List<DocumentSnapshot> data = snapshot.data!;

                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onLongPress: () {},
                          child: Card(
                            elevation: 10,
                            child: ListTile(
                              title: Text(data[index]["judulbuku"]), // Menampilkan judul buku
                              subtitle: Text(data[index]["selectedValue"]), // Menampilkan data terkait buku
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => EditBuku(
                                                bukuid: data[index]['bukuid'], // Mengirim data ke halaman EditBuku
                                                judulbuku: data[index]
                                                    ['judulbuku'],
                                                pengarangbuku: data[index]
                                                    ['pengarangbuku'],
                                                penerbitbuku: data[index]
                                                    ['penerbitbuku'],
                                                selectedValue: data[index]
                                                    ['selectedValue']),
                                          ),
                                        );
                                      },
                                      icon: Icon(Icons.mode_edit_outlined)), // Tombol untuk mengedit buku
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      bc.removeBuku(
                                          data[index]["bukuid"].toString()); // Menghapus buku berdasarkan ID
                                      setState(() {
                                        bc.getBuku(); // Memperbarui daftar buku setelah menghapus
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
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
        child: const Icon(Icons.add), /// Tombol untuk menambahkan buku baru
      ),
    );
  }
}
