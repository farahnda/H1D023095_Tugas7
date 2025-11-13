import 'package:flutter/material.dart';
import 'package:h1d023095_tugas7/widgets/sidemenu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/sidemenu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var username = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? 'Guest';
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidemenu(),
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Text(
          'Selamat datang, $username 👋',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}