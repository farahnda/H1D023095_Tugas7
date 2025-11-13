import 'package:flutter/material.dart';
import 'package:h1d023095_tugas7/pages/about_page.dart';
import 'package:h1d023095_tugas7/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sidemenu extends StatelessWidget {
  const Sidemenu({super.key});

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Center(
              child: Text(
                'Tugas 7 Menu',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ),
          ListTile(
            leading: const Icon (Icons.home),
            title: const Text ('Beranda'),
            onTap: () => Navigator.pushReplacementNamed(context, '/home'),
          ),
          ListTile(
            leading: const Icon (Icons.person),
            title: const Text ('Profil'),
            onTap: () => Navigator.pushReplacementNamed(context, '/profile'),
          ),
          ListTile(
            leading: const Icon (Icons.info_outline),
            title: const Text ('Tentang'),
            onTap: () => Navigator.pushReplacementNamed(context, '/about'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon (Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () => _logout(context),
          ),
        ],
      ),
    );
  }
}