import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pawn_book/controller/peminjam_controller.dart';
import 'package:pawn_book/view/add_daftarbuku.dart';
import 'package:pawn_book/view/add_daftarpeminjam.dart';
import 'package:pawn_book/view/widget/header.dart';
import 'package:pawn_book/view/widget/sidemenu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var peminjamcontroller = PeminjamController();

  @override
  void initState() {
    peminjamcontroller.getPinjam();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: header(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: StreamBuilder<List<DocumentSnapshot>>(
                stream: peminjamcontroller.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final List<DocumentSnapshot> datapinjam = snapshot.data!;

                  return ListView.builder(
                    itemCount: datapinjam.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => DetailIb(
                            //       pregid: datapreg[index]['pregid'],
                            //       usiajanin: datapreg[index]['usiajanin'],
                            //       formatDate:
                            //           datapreg[index]['formatDate'].toString(),
                            //       bbpreg: datapreg[index]['bbpreg'],
                            //       selectedvalue: datapreg[index]
                            //           ['selectedvalue'],
                            //       keluhan: datapreg[index]['keluhan'],
                            //       tindakan: datapreg[index]['tindakan'],
                            //     ),
                            //   ),
                            // );
                          },
                          child: Card(
                            elevation: 10,
                            child: ListTile(
                              title: Text(datapinjam[index]['namapeminjam']),
                              leading: const Icon(Icons.book),
                              subtitle:
                                  Text(datapinjam[index]['jbuku'].toString()),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  peminjamcontroller.removePeminjam(
                                      datapinjam[index]['pid'].toString());
                                  setState(() {
                                    peminjamcontroller.getPinjam();
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Data Peminjam Dihapus')));
                                },
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
