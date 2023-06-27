import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawn_book/model/buku_model.dart';

class BukuController {
  final bukucollection = FirebaseFirestore.instance.collection('buku');

  final StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  Stream<List<DocumentSnapshot>> get stream => streamController.stream;

  Future<void> addBuku(BukuModel bkmodel) async {
    final buku = bkmodel.toMap();

    final DocumentReference docRef = await bukucollection.add(buku);

    final String docId = docRef.id;

    final BukuModel bukuModel = BukuModel(
        bukuid: docId,
        judulbuku: bkmodel.judulbuku,
        pengarangbuku: bkmodel.pengarangbuku,
        penerbitbuku: bkmodel.penerbitbuku,
        selectedValue: bkmodel.selectedValue);

    await docRef.update(bukuModel.toMap());
  }

  // Future<void> updateContact(BukuModel bkmodel) async {
  //   final BukuModel bukuModel = BukuModel(
  //       bukuid: docId,
  //       judulbuku: bkmodel.judulbuku,
  //       pengarangbuku: bkmodel.pengarangbuku,
  //       penerbitbuku: bkmodel.penerbitbuku,
  //       selectedValue: bkmodel.selectedValue);

  //   await contactcollection.doc(ctmodel.id).update(contactModel.toMap());
  // }

  // Future<void> removeContact(String id) async {
  //   await contactcollection.doc(id).delete();
  // }

  Future getBuku() async {
    final contact = await bukucollection.get();
    streamController.add(contact.docs);
    return contact.docs;
  }
}
