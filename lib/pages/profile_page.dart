import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/sidemenu.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<String> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? 'Guest';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidemenu(),
      appBar: AppBar(title: const Text('Profil')),
      body: FutureBuilder(
        future: getUsername(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person, size: 100, color: Colors.teal),
                const SizedBox(height: 10),
                Text('Nama Pengguna: ${snapshot.data}',
                  style: const TextStyle(fontSize: 18)),
              ],
            ),
          );
        },
      ),
    );
  }
}