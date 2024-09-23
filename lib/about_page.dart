import 'package:flutter/material.dart';
import 'package:pertemuan3/sidemenu.dart';
import 'package:pertemuan3/home_page.dart'; 

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
        backgroundColor: Colors.pink[400], 
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              // Aksi ketika ikon ditekan
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tentang Aplikasi',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.pink, 
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Aplikasi ini dirancang untuk memudahkan Anda dalam mengelola keuangan dan transaksi.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Fitur Utama:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pink, 
              ),
            ),
            const SizedBox(height: 10),
            _featureItem(Icons.send, 'Transfer Uang', 'Kirim dan terima uang dengan mudah.'),
            _featureItem(Icons.monetization_on, 'Cek Kurs', 'Dapatkan informasi terkini tentang kurs.'),
            _featureItem(Icons.history, 'Riwayat Transaksi', 'Lihat semua transaksi yang telah Anda lakukan.'),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                // Navigasi kembali ke Homepage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Homepage()),
                );
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              label: const Text('Kembali'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[400], 
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      drawer: const Sidemenu(),
    );
  }

  Widget _featureItem(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.pink[400], size: 30), 
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
