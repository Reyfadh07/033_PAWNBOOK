/// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BukuModel {
  String? bukuid; /// ID buku (Opsional)
  final String judulbuku; /// Judul buku (Wajib)
  final String pengarangbuku; /// Nama pengarang buku (Wajib)
  final String penerbitbuku; /// Nama penerbit buku (Wajib)
  final String selectedValue; /// Nilai terpilih (Wajib)

  BukuModel({
    this.bukuid,
    required this.judulbuku,
    required this.pengarangbuku,
    required this.penerbitbuku,
    required this.selectedValue,
  });

  ///Mengonversi objek BukuModel ke Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bukuid': bukuid,
      'judulbuku': judulbuku,
      'pengarangbuku': pengarangbuku,
      'penerbitbuku': penerbitbuku,
      'selectedValue': selectedValue,
    };
  }

  /// Membuat objek BukuModel dari Map
  factory BukuModel.fromMap(Map<String, dynamic> map) {
    return BukuModel(
      bukuid: map['bukuid'] != null ? map['bukuid'] as String : null,
      judulbuku: map['judulbuku'] as String,
      pengarangbuku: map['pengarangbuku'] as String,
      penerbitbuku: map['penerbitbuku'] as String,
      selectedValue: map['selectedValue'] as String,
    );
  }

  /// Mengonversi objek BukuModel menjadi JSON
  String toJson() => json.encode(toMap());

  /// Membuat objek BukuModel dari JSON
  factory BukuModel.fromJson(String source) =>
      BukuModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
