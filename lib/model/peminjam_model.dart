/// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PeminjamModel {
  String? pid; /// ID peminjam (Opsional)
  final String namapeminjam; /// Nama peminjam (Wajib)
  final String selectedBuku; /// Judul buku yang dipinjam (Wajib)
  final String pengarang; /// Nama pengarang buku (Wajib)
  final String tglpinjam; /// Tanggal peminjaman (Wajib)
  final String tglkembali; /// Tanggal pengembalian (Wajib)

  PeminjamModel({
    this.pid,
    required this.namapeminjam,
    required this.selectedBuku,
    required this.pengarang,
    required this.tglpinjam,
    required this.tglkembali,
  });

  /// Mengonversi objek PeminjamModel ke Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pid': pid,
      'namapeminjam': namapeminjam,
      'selectedBuku': selectedBuku,
      'pengarang': pengarang,
      'tglpinjam': tglpinjam,
      'tglkembali': tglkembali,
    };
  }

  /// Membuat objek PeminjamModel dari Map
  factory PeminjamModel.fromMap(Map<String, dynamic> map) {
    return PeminjamModel(
      pid: map['pid'] != null ? map['pid'] as String : null,
      namapeminjam: map['namapeminjam'] as String,
      selectedBuku: map['selectedBuku'] as String,
      pengarang: map['pengarang'] as String,
      tglpinjam: map['tglpinjam'] as String,
      tglkembali: map['tglkembali'] as String,
    );
  }

  /// Mengonversi objek PeminjamModel menjadi JSON
  String toJson() => json.encode(toMap());

  /// Membuat objek PeminjamModel dari JSON
  factory PeminjamModel.fromJson(String source) =>
      PeminjamModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
