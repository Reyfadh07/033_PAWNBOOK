import 'package:flutter/material.dart';
import 'package:pawn_book/view/registerpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                "images/logoapp.png",
                width: 200,
                height: 300,
              ),
            ),
            Container(
              child: const Text(
                "Aplikasi Perpustakaan.",
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 30, left: 30),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Nama",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.redAccent, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Masukan Nama',
                        hintStyle: TextStyle(fontSize: 20),
                        prefixIcon: Icon(
                          Icons.person_2,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 30, left: 30),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Password",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.redAccent, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Masukan Password',
                          hintStyle: TextStyle(fontSize: 20),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.redAccent,
                          ),
                          suffixIcon: Icon(Icons.remove_red_eye)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 70),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          backgroundColor: Colors.redAccent,
                          minimumSize: const Size(350, 60)),
                      child: const Text(
                        "Masuk",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Tidak meiliki Akun",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
                        },
                        child: const Text(
                          "Daftar",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
