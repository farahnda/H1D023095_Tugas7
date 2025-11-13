import 'package:flutter/material.dart';
import 'package:h1d023095_tugas7/pages/login_page.dart';
import 'package:h1d023095_tugas7/pages/home_page.dart';
import 'package:h1d023095_tugas7/pages/profile_page.dart';
import 'package:h1d023095_tugas7/pages/about_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 7 Flutter',
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}