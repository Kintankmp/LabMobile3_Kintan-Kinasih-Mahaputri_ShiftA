import 'package:flutter/material.dart';
import 'package:pertemuan3/about_page.dart';
import 'package:pertemuan3/home_page.dart';
import 'package:pertemuan3/login_page.dart'; 

class Sidemenu extends StatelessWidget {
  const Sidemenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.pink, // Ubah warna menjadi pink[400]
            ),
            child: Center(
              child: Text(
                'Menu Lainnya',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Beranda'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Homepage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Tentang'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Keluar'),
            onTap: () {
              // Navigasi kembali ke halaman login
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Loginpage(), 
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
