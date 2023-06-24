import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 260,
          height: double.infinity,
          color: Color.fromARGB(255, 207, 135, 109),
          child: Column(
            children: [
              const ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text(
                  "Admin",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: SizedBox(
                  height: 34,
                  width: 34,
                  child: Icon(Icons.list_alt_sharp),
                ),
                title: Text("Daftar Peminjam"),
              ),
              ListTile(
                onTap: () {},
                leading: SizedBox(
                  height: 34,
                  width: 34,
                  child: Icon(Icons.book),
                ),
                title: Text("Daftar Buku"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
