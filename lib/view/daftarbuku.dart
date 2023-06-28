import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pawn_book/controller/buku_controller.dart';
import 'package:pawn_book/view/add_daftarbuku.dart';
import 'package:pawn_book/view/widget/header.dart';
import 'package:pawn_book/view/widget/sidemenu.dart';

class DaftarBuku extends StatefulWidget {
  const DaftarBuku({super.key});

  @override
  State<DaftarBuku> createState() => _DaftarBukuState();
}

class _DaftarBukuState extends State<DaftarBuku> {
  var bc = BukuController();

  @override
  void initState() {
    bc.getBuku();
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
            const Text(
              "Buku list",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: StreamBuilder<List<DocumentSnapshot>>(
                stream: bc.stream,
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
                          onLongPress: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => UpdateBuku(
                            //         id: data[index]['id'],
                            //         name: data[index]['name'],
                            //         phone: data[index]['phone'],
                            //         email: data[index]['email'],
                            //         address: data[index]['address']),
                            //   ),
                            // );
                          },
                          child: Card(
                            elevation: 10,
                            child: ListTile(
                              // leading: CircleAvatar(
                              //   backgroundColor: Colors.red,
                              //   child: Text(
                              //     data[index]["name"]
                              //         .substring(0, 1)
                              //         .toUpperCase(),
                              //     style: const TextStyle(
                              //         color: Colors.white,
                              //         fontWeight: FontWeight.bold),
                              //   ),
                              // ),
                              title: Text(data[index]["judulbuku"]),
                              subtitle: Text(data[index]["selectedValue"]),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  bc.removeBuku(
                                      data[index]["bukuid"].toString());
                                  setState(() {
                                    bc.getBuku();
                                  });
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
        child: const Icon(Icons.add),
      ),
    );
  }
}
