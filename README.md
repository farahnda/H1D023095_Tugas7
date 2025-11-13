Nama: Farah Tsani Maulida
NIM: H1D023095
Shift D -> Shift F

# Screenshot Aplikasi

# Penjelasan Tiap Bagian Kode
## 1. `main.dart`
Merupakan file utama yang menjalankan aplikasi.

```
void main() {
  runApp(const MyApp());
}
```
- Fungsi `main()` adalah titik awal program.
- `runApp()` menjalankan widget `MyApp()` sebagai root dari aplikasi.

```
class MyApp extends StatelessWidget {
  const MyApp({super.key});
```
- MyApp adalah widget utama aplikasi.
- StatelessWidget karena tampilannya tidak berubah dinamis di sini.

```
return MaterialApp(
  title: 'Tugas 7 Flutter',
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
```
- MaterialApp adalah struktur dasar aplikasi Flutter.
- title: judul aplikasi.
- theme: menggunakan warna dasar teal dengan Material Design 3.
- initialRoute: halaman pertama (/) → LoginPage.
- routes: daftar halaman dengan nama rutenya:
  - '/' → halaman login
  - '/home' → halaman beranda
  - '/profile' → halaman profil
  - '/about' → halaman tentang aplikasi
 
## 2. `login_page.dart`
Merupakan halaman untuk login dan menyimpan username ke local storage.
```
final TextEditingController username = TextEditingController();
final TextEditingController password = TextEditingController();
```
- Controller untuk membaca input dari TextField.

```
Future<void> _login() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (username.text == 'admin' && password.text == 'admin') {
    await prefs.setString('username', username.text);
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  } else {
    showDialog(...);
  }
}
```

- Mengambil instance dari SharedPreferences untuk menyimpan data lokal.
- Mengecek jika username & password = 'admin'.
- Jika benar → simpan username ke storage dan arahkan ke /home.
- Jika salah → munculkan AlertDialog "Login gagal".

```
body: Center(
  child: Card(
    elevation: 10,
    margin: const EdgeInsets.all(24),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [...]
```
Tampilan login dibuat dalam Card dengan desain lembut (RoundedRectangleBorder, padding besar, warna latar teal.shade50).

## 3. `home_page.dart`
Merupakan halaman utama setelah login.
`
var username = '';
`
Variabel untuk menampung username yang disimpan di local storage.

```
@override
void initState() {
  super.initState();
  _loadUsername();
}
```
Saat halaman dibuat pertama kali, fungsi _loadUsername() dipanggil.

```
Future<void> _loadUsername() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    username = prefs.getString('username') ?? 'Guest';
  });
}
```

- Mengambil username yang disimpan di SharedPreferences.
Jika belum ada → default 'Guest'.

```
Scaffold(
  drawer: const Sidemenu(),
  appBar: AppBar(title: const Text('Home Page')),
  body: Center(
    child: Text('Selamat datang, $username 👋', ...)
  ),
)
```
Tampilan utama dengan:
- AppBar
- Drawer (menu samping)
- Tulisan sambutan dengan nama user.

## 4. `profile_page.dart
Untuk menampilkan profil pengguna dari data yang disimpan lokal.

```
Future<String> getUsername() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('username') ?? 'Guest';
}
```
Fungsi untuk mengambil username dari penyimpanan lokal.

```
FutureBuilder(
  future: getUsername(),
  builder: (context, snapshot) {
    if (!snapshot.hasData)
      return const Center(child: CircularProgressIndicator());
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person, size: 100, color: Colors.teal),
          const SizedBox(height: 10),
          Text('Nama Pengguna: ${snapshot.data}', ...),
        ],
      ),
    );
  },
),
```

- FutureBuilder digunakan untuk menunggu data username dari storage.
- Jika belum ada → tampilkan loading spinner.
- Jika sudah ada → tampilkan nama pengguna dengan ikon profil.

## 5. `about_page.dart`
Menjelaskan tentang aplikasi.
```
Scaffold(
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
```
Hanya teks penjelasan aplikasi dengan padding dan style rapi.

## 6. `sidemenu.dart`
Menu samping (drawer) untuk navigasi antar halaman.
```
Future<void> _logout(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
}
```
Menghapus semua data (logout) dan kembali ke halaman login.

```
Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(color: Colors.teal),
        child: Center(
          child: Text('Tugas 7 Menu', style: TextStyle(color: Colors.white, fontSize: 22)),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('Beranda'),
        onTap: () => Navigator.pushReplacementNamed(context, '/home'),
      ),
      ...
      ListTile(
        leading: const Icon(Icons.logout, color: Colors.red),
        title: const Text('Logout', style: TextStyle(color: Colors.red)),
        onTap: () => _logout(context),
      ),
    ],
  ),
);
```
Drawer berisi:
- Header dengan judul “Tugas 7 Menu”
- Navigasi ke halaman Home, Profil, Tentang
- Tombol Logout (warna merah)
