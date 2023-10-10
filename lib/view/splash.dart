import 'package:flutter/material.dart';
import 'package:pawn_book/view/homepage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // Menggunakan initState untuk menunda navigasi ke halaman beranda.
    super.initState();

    // Menggunakan Future.delayed untuk menunggu selama 4 detik.
    Future.delayed(const Duration(seconds: 4)).then((value) {
      // Setelah 4 detik, navigasikan pengguna ke halaman beranda.
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('images/logoapp.png')],
        ),
      )),
    );
  }
}
