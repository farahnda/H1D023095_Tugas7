import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (username.text == 'admin' && password.text == 'admin') {
      await prefs.setString('username', username.text);
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } else {
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          title: Text("Login gagal"),
          content: Text("Username atau password salah"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: Center(
        child: Card(
          elevation: 10,
          margin: const EdgeInsets.all(24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.lock_outline, size: 60, color: Colors.teal),
                const SizedBox(height: 16),
                TextField(
                  controller: username,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _login,
                  icon: const Icon(Icons.login),
                  label: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
