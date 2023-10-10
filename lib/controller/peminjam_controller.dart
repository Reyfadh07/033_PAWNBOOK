import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawn_book/model/peminjam_model.dart';

class PeminjamController {
  /// Koleksi Firestore untuk peminjam
  final pinjamcollection = FirebaseFirestore.instance.collection('peminjam');

  /// StreamController untuk mengirim data secara realtime
  final StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  /// Getter untuk mengakses stream dari StreamController
  Stream<List<DocumentSnapshot>> get stream => streamController.stream;

  /// Metode untuk menambahkan data peminjam ke Firestore
  Future<void> addPeminjam(PeminjamModel pjmodel) async {
    /// Mengonversi objek PeminjamModel ke Map
    final peminjam = pjmodel.toMap();

    /// Menambahkan data ke Firestore dan mendapatkan DocumentReference
    final DocumentReference docRef = await pinjamcollection.add(peminjam);

    /// Mendapatkan ID dokumen yang baru saja ditambahkan
    final String docId = docRef.id;

    /// Membuat objek PeminjamModel dengan ID yang baru dan memperbarui Firestore
    final PeminjamModel peminjamModel = PeminjamModel(
      pid: docId,
      namapeminjam: pjmodel.namapeminjam,
      selectedBuku: pjmodel.selectedBuku,
      pengarang: pjmodel.pengarang,
      tglpinjam: pjmodel.tglpinjam,
      tglkembali: pjmodel.tglkembali,
    );

    await docRef.update(peminjamModel.toMap());
  }

  /// Metode untuk memperbarui informasi peminjam di Firestore
  Future<void> updatePeminjam(PeminjamModel pjmodel) async {
    /// Membuat objek PeminjamModel yang akan digunakan untuk memperbarui Firestore
    final PeminjamModel peminjamModel = PeminjamModel(
      pid: pjmodel.pid,
      namapeminjam: pjmodel.namapeminjam,
      selectedBuku: pjmodel.selectedBuku,
      pengarang: pjmodel.pengarang,
      tglpinjam: pjmodel.tglpinjam,
      tglkembali: pjmodel.tglkembali,
    );

    /// Memperbarui data peminjam di Firestore menggunakan ID peminjam
    await pinjamcollection.doc(pjmodel.pid).update(peminjamModel.toMap());
  }

  /// Metode untuk menghapus data peminjam dari Firestore
  Future<void> removePeminjam(String pid) async {
    /// Menghapus dokumen peminjam berdasarkan ID
    await pinjamcollection.doc(pid).delete();
  }

  /// Metode untuk mengambil daftar peminjam dari Firestore
  Future getPinjam() async {
    /// Mengambil data peminjam dari Firestore
    final contact = await pinjamcollection.get();

    /// Mengirimkan daftar dokumen peminjam ke StreamController
    streamController.add(contact.docs);

    /// Mengembalikan daftar dokumen peminjam
    return contact.docs;
  }
}

