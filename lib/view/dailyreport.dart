import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DailyReportPage extends StatefulWidget {
  const DailyReportPage({Key? key}) : super(key: key);

  @override
  _DailyReportPageState createState() => _DailyReportPageState();
}

class _DailyReportPageState extends State<DailyReportPage> {
  DateTime selectedDate = DateTime.now();
  DateTime filterDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        filterDate = picked;
      });
    }
  }

  void filterByDate(DateTime date) {
    setState(() {
      filterDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Report'),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('peminjam').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          final peminjamanList = snapshot.data!.docs.where((doc) {
            DateTime tanggalPeminjaman =
                DateFormat('dd-MM-yyyy').parse(doc['tglpinjam']);
            return DateFormat('yyyy-MM-dd').format(tanggalPeminjaman) ==
                DateFormat('yyyy-MM-dd').format(filterDate);
          }).toList();
          return ListView.builder(
            itemCount: peminjamanList.length,
            itemBuilder: (context, index) {
              final peminjaman = peminjamanList[index];
              final tanggalPeminjaman = peminjaman['tglpinjam'];
              final namaPeminjam = peminjaman['namapeminjam'];
              final judulBuku = peminjaman['selectedBuku'];
              return ListTile(
                title: Text('Peminjam: $namaPeminjam'),
                subtitle: Text('Buku: $judulBuku'),
                trailing: Text('Tanggal: $tanggalPeminjaman'),
              );
            },
          );
        },
      ),
    );
  }
}
