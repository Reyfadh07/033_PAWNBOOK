import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pawn_book/controller/peminjam_controller.dart';
import 'package:pawn_book/view/add_daftarbuku.dart';
import 'package:pawn_book/view/add_daftarpeminjam.dart';
import 'package:pawn_book/view/edit_daftarpeminjam.dart';
import 'package:pawn_book/view/widget/header.dart';
import 'package:pawn_book/view/widget/sidemenu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controller untuk mengelola data peminjam
  var peminjamcontroller = PeminjamController();

  @override
  void initState() {
    // Memanggil metode untuk mendapatkan daftar peminjam saat inisialisasi
    peminjamcontroller.getPinjam();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      // Drawer (menu samping) untuk navigasi
      drawer: SideMenu(),
      // AppBar (header) untuk tampilan atas
      appBar: header(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: StreamBuilder<List<DocumentSnapshot>>(
                // Menggunakan StreamBuilder untuk mendengarkan perubahan data peminjam
                stream: peminjamcontroller.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    // Tampilkan indikator loading jika data belum tersedia
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  // Ambil data peminjam dari snapshot
                  final List<DocumentSnapshot> datapinjam = snapshot.data!;

                  // Tampilkan daftar peminjam dalam ListView
                  return ListView.builder(
                    itemCount: datapinjam.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onLongPress: () {},
                          child: Card(
                            elevation: 10,
                            child: ListTile(
                              title: Text(datapinjam[index]['namapeminjam']),
                              leading: const Icon(Icons.book),
                              subtitle: Text(
                                  datapinjam[index]['selectedBuku'].toString()),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Tombol untuk mengedit data peminjam
                                  IconButton(
                                      onPressed: () {
                                        // Navigasi ke halaman EditPeminjam dengan membawa data peminjam yang akan diedit
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => EditPeminjam(
                                              pid: datapinjam[index]['pid'],
                                              namapeminjam: datapinjam[index]
                                                  ['namapeminjam'],
                                              selectedBuku: datapinjam[index]
                                                      ['selectedBuku']
                                                  .toString(),
                                              pengarang: datapinjam[index]
                                                  ['pengarang'],
                                              tglpinjam: datapinjam[index]
                                                  ['tglpinjam'],
                                              tglkembali: datapinjam[index]
                                                  ['tglkembali'],
                                            ),
                                          ),
                                        );
                                      },
                                      icon: Icon(Icons.mode_edit_outlined)),
                                  // Tombol untuk menghapus data peminjam
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      // Hapus data peminjam berdasarkan PID
                                      peminjamcontroller.removePeminjam(
                                          datapinjam[index]['pid'].toString());
                                      setState(() {
                                        // Muat ulang data peminjam setelah menghapus
                                        peminjamcontroller.getPinjam();
                                      });

                                      // Tampilkan pesan sukses
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Data Peminjam Dihapus')));
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
            )
          ],
        ),
      ),
      // Tombol Floating Action Button (FAB) untuk menambahkan peminjam baru
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi ke halaman AddPeminjam untuk menambahkan peminjam baru
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPeminjam(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
