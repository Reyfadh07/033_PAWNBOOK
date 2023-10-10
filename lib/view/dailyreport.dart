import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:pawn_book/view/widget/header.dart';
import 'package:pawn_book/view/widget/sidemenu.dart';

class DailyReportPage extends StatefulWidget {
  const DailyReportPage({Key? key}) : super(key: key);

  @override
  _DailyReportPageState createState() => _DailyReportPageState();
}

class _DailyReportPageState extends State<DailyReportPage> {
  DateTime selectedDate = DateTime.now(); /// Menyimpan tanggal yang dipilih oleh pengguna
  DateTime filterDate = DateTime.now(); /// Menyimpan tanggal yang digunakan untuk filter laporan

  Future<void> _selectDate(BuildContext context) async {
    /// Metode untuk memilih tanggal dari kalender
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked; /// Memperbarui tanggal yang dipilih oleh pengguna
        filterDate = picked; /// Menggunakan tanggal yang dipilih untuk filter laporan
      });
    }
  }

  void filterByDate(DateTime date) {
    /// Metode untuk memfilter laporan berdasarkan tanggal
    setState(() {
      filterDate = date; /// Memperbarui tanggal filter laporan
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// appBar: header(context), /// (Opsional) Apakah Anda akan menggunakan widget appBar yang kustom
      drawer: SideMenu(), /// Menampilkan menu samping (jika diperlukan)
      appBar: AppBar(
        title: Text('Daily Report'), /// Judul halaman
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context), /// Tombol untuk memilih tanggal
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('peminjam').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator(); /// Menampilkan indikator loading jika data belum tersedia
          }
          final peminjamanList = snapshot.data!.docs.where((doc) {
            DateTime tanggalPeminjaman =
                DateFormat('dd-MM-yyyy').parse(doc['tglpinjam']);
            return DateFormat('yyyy-MM-dd').format(tanggalPeminjaman) ==
                DateFormat('yyyy-MM-dd').format(filterDate);
          }).toList(); /// Memfilter daftar peminjaman berdasarkan tanggal yang dipilih
          return ListView.builder(
            itemCount: peminjamanList.length,
            itemBuilder: (context, index) {
              final peminjaman = peminjamanList[index];
              final tanggalPeminjaman = peminjaman['tglpinjam'];
              final namaPeminjam = peminjaman['namapeminjam'];
              final judulBuku = peminjaman['selectedBuku'];
              return ListTile(
                title: Text('Peminjam: $namaPeminjam'), /// Menampilkan nama peminjam
                subtitle: Text('Buku: $judulBuku'), /// Menampilkan judul buku
                trailing: Text('Tanggal: $tanggalPeminjaman'), // Menampilkan tanggal peminjaman
              );
            },
          );
        },
      ),
    );
  }
}

