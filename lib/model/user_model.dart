/// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String name;  /// Nama pengguna
  String email; /// Alamat email pengguna
  String uID;   /// ID unik pengguna

  UserModel({
    required this.name,
    required this.email,
    required this.uID,
  });

  /// Mengonversi objek UserModel ke Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'uID': uID,
    };
  }

  /// Membuat objek UserModel dari Map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      uID: map['uID'] as String,
    );
  }

  /// Mengonversi objek UserModel menjadi JSON
  String toJson() => json.encode(toMap());

  /// Membuat objek UserModel dari JSON
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  /// Metode statis untuk membuat objek UserModel dari objek Firebase User
  static UserModel? fromFirebaseUser(User user) {
    /// Implementasikan kode di sini untuk membuat objek UserModel dari objek Firebase User
    /// Ini adalah metode yang harus diimplementasikan oleh pengguna sesuai dengan kebutuhan aplikasi mereka.
    /// Anda bisa mengambil informasi dari objek Firebase User seperti email dan nama untuk membuat UserModel.
    /// Jika Anda tidak memerlukan metode ini, Anda dapat mengosongkannya atau mengembalikan null.
  }
}

