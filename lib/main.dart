import 'package:flutter/material.dart';
import 'package:pertemuan3/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Menu',
      home: Loginpage(),
    );
  }
}
