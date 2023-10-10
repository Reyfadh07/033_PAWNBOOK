import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawn_book/model/buku_model.dart';

class BukuController {
  /// Koleksi Firestore untuk buku
  final bukucollection = FirebaseFirestore.instance.collection('buku');

  /// StreamController untuk mengirim data secara realtime
  final StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  /// Getter untuk mengakses stream dari StreamController
  Stream<List<DocumentSnapshot>> get stream => streamController.stream;

  /// Metode untuk menambahkan buku ke Firestore
  Future<void> addBuku(BukuModel bkmodel) async {
    /// Mengonversi objek BukuModel ke Map
    final buku = bkmodel.toMap();

    /// Menambahkan data ke Firestore dan mendapatkan DocumentReference
    final DocumentReference docRef = await bukucollection.add(buku);

    /// Mendapatkan ID dokumen yang baru saja ditambahkan
    final String docId = docRef.id;

    /// Membuat objek BukuModel dengan ID yang baru dan memperbarui Firestore
    final BukuModel bukuModel = BukuModel(
        bukuid: docId,
        judulbuku: bkmodel.judulbuku,
        pengarangbuku: bkmodel.pengarangbuku,
        penerbitbuku: bkmodel.penerbitbuku,
        selectedValue: bkmodel.selectedValue);

    await docRef.update(bukuModel.toMap());
  }

  /// Metode untuk memperbarui informasi buku di Firestore
  Future<void> updateBuku(BukuModel bkmodel) async {
    /// Membuat objek BukuModel yang akan digunakan untuk memperbarui Firestore
    final BukuModel bukuModel = BukuModel(
        bukuid: bkmodel.bukuid,
        judulbuku: bkmodel.judulbuku,
        pengarangbuku: bkmodel.pengarangbuku,
        penerbitbuku: bkmodel.penerbitbuku,
        selectedValue: bkmodel.selectedValue);

    /// Memperbarui data buku di Firestore menggunakan ID buku
    await bukucollection.doc(bkmodel.bukuid).update(bukuModel.toMap());
  }

  /// Metode untuk menghapus buku dari Firestore
  Future<void> removeBuku(String bukuid) async {
    /// Menghapus dokumen buku berdasarkan ID
    await bukucollection.doc(bukuid).delete();
  }

  /// Metode untuk mengambil daftar buku dari Firestore
  Future getBuku() async {
    /// Mengambil data buku dari Firestore
    final contact = await bukucollection.get();

    /// Mengirimkan daftar dokumen buku ke StreamController
    streamController.add(contact.docs);

    /// Mengembalikan daftar dokumen buku
    return contact.docs;
  }
}
