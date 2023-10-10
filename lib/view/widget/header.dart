import 'package:flutter/material.dart';

/// Fungsi AppBar digunakan untuk membuat tampilan AppBar dengan judul 'PawnBook'.
/// Anda dapat memanggil fungsi ini untuk menampilkan AppBar dalam tampilan aplikasi Anda.
/// - Parameter 'context': BuildContext dari widget yang memanggil fungsi ini.
/// - Parameter 'removeBackbutton': Opsional, defaultnya adalah false. Jika diatur true,
///   tombol kembali (back button) tidak akan ditampilkan di AppBar.
AppBar header(context, {removeBackbutton = false}) {
  return AppBar(
    title: Text(
      'PawnBook', /// Judul yang akan ditampilkan di AppBar
      style: TextStyle(fontFamily: "ShortBaby"), // Gaya teks judul
    ),
  );
}
