import 'package:flutter/material.dart';
import 'package:h1d023095_tugas7/widgets/sidemenu.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidemenu(),
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Aplikasi ini dibuat sebagai tugas 7 Flutter.\n'
          'Fitur: Login, Routes, Drawer, dan Local Storage.\n'
          'Dikembangkan dengan desain yang lebih modern dan responsif.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
