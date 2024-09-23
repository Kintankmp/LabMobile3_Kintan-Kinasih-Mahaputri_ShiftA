# pertemuan3

A new Flutter project.
Nama : Kintan Kinasih Mahaputri
NIM : H1D022019
Shift : A

## Penjelasan Code Penting
a. ABout_page.dart
1. Import Package
import 'package:flutter/material.dart';
import 'package:pertemuan3/sidemenu.dart';
import 'package:pertemuan3/home_page.dart'; 
- Mengimpor package `flutter/material.dart` untuk membuat UI dengan material design.
- Mengimpor `sidemenu.dart` dan `home_page.dart` yang merupakan file lain dalam aplikasi, yang berisi komponen side menu dan halaman utama.

2. AboutPage
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
- `AboutPage` adalah kelas yang mewarisi `StatelessWidget`, yang berarti halaman ini tidak menyimpan perubahan keadaan (state).
- `const AboutPage` menunjukkan bahwa widget ini immutable (tidak dapat berubah) dan diinisialisasi dengan `key`.
 3. Bulid method
@override
Widget build(BuildContext context) {
- `build()` adalah metode utama yang dipanggil untuk merender UI pada widget `AboutPage`.
- `BuildContext` menyediakan akses ke tree widget dan informasi navigasi di aplikasi.

4. Scaffold
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
- `Scaffold` menyediakan struktur halaman dasar dengan `AppBar`, `Drawer`, dan `Body`.
- `AppBar` menampilkan judul "Tentang Aplikasi" dan memiliki warna latar belakang pink. `actions` digunakan untuk menambahkan tombol info (`IconButton`) di sudut kanan atas. Saat ini tombol info tidak memiliki aksi.
5. Body dengan padding dan column
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
- `Padding`: Memberikan jarak di sekitar isi halaman.
- `Column`: Mengatur item dalam bentuk vertikal. Dalam `children`, item pertama adalah teks judul "Tentang Aplikasi" yang ditampilkan dengan font tebal dan ukuran 28, serta warna pink.
- `SizedBox`: Menyediakan jarak vertikal antara widget.
- `Text`: Teks penjelasan singkat tentang aplikasi yang disejajarkan di tengah (`textAlign: TextAlign.center`).

6. Fitur utama
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
- Menampilkan teks "Fitur Utama" dengan ukuran font 20 dan warna pink.
- Memanggil fungsi `_featureItem` untuk membuat item fitur: `Transfer Uang`, `Cek Kurs`, dan `Riwayat Transaksi`. Setiap fitur memiliki ikon, judul, dan deskripsi singkat.

7.ElevatedButton
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
- Tombol `ElevatedButton` dengan ikon panah belakang dan teks "Kembali". 
- Ketika tombol ditekan, halaman akan dinavigasikan ke halaman `Homepage` menggunakan `Navigator.pushReplacement`, yang mengganti halaman saat ini dengan `Homepage`.
- `style`: Mengatur warna latar belakang pink dan padding tombol.

8. Drawer
  drawer: const Sidemenu(),
);
- Menambahkan drawer (menu samping) dengan widget `Sidemenu`. Drawer ini akan muncul di sisi kiri layar dan memberikan akses ke menu navigasi lainnya.

9. _featureItem
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
- Fungsi `_featureItem` membuat widget untuk menampilkan item fitur aplikasi.
- Menggunakan `Row` untuk menampilkan ikon di sebelah kiri dan teks (judul dan deskripsi fitur) di sebelah kanan.
- `Expanded` memungkinkan teks mengambil ruang yang tersedia di samping ikon.

b. home_page.dart
1. Homepageclass
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  HomepageState createState() => HomepageState();
}
`Homepage` adalah kelas yang menggunakan `StatefulWidget` karena memerlukan penyimpanan dan pembaruan data pengguna (nama pengguna). Fungsi `createState` membuat state dari `HomepageState` yang akan mengelola logika dan tampilan halaman.

2. _loadusername
void _loadUsername() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    namauser = prefs.getString('username') ?? "Pengguna";
  });
}
Fungsi `_loadUsername` digunakan untuk mengambil nama pengguna yang telah disimpan dalam `SharedPreferences`. Jika tidak ada nama pengguna yang ditemukan, maka akan menggunakan "Pengguna" sebagai nilai default. Fungsi `setState` memicu pembaruan tampilan setelah nama pengguna dimuat.
3. Method
@override
void initState() {
  super.initState();
  _loadUsername();
}
`initState` dipanggil saat `Homepage` pertama kali diinisialisasi. Fungsi ini memastikan bahwa nama pengguna dimuat segera setelah halaman dibuat dengan memanggil `_loadUsername`.
4. scaffold
return Scaffold(
  appBar: AppBar(
    title: const Text('Beranda'),
    backgroundColor: Colors.pink[400],
  ),
  body: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.pink, Colors.pink[200]!], 
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Center(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5))],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Selamat Datang!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
              ),
              const SizedBox(height: 20),
              Text(
                'Halo, $namauser!',
                style: const TextStyle(fontSize: 18, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Text(
                'Fitur Utama',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink),
              ),
              const SizedBox(height: 10),
              _featureCard('Transfer Uang', 'Kirim dan terima uang dengan mudah.'),
              _featureCard('Cek Kurs', 'Dapatkan informasi terkini tentang kurs.'),
              _featureCard('Riwayat Transaksi', 'Lihat semua transaksi yang telah Anda lakukan.'),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.pink[400],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.remove('username');
                  if (!mounted) return;
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Loginpage()));
                },
                child: const Text('Logout', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    ),
  ),
  drawer: const Sidemenu(),
);
Bagian ini membentuk struktur halaman dengan `Scaffold` yang berisi `AppBar` dengan latar belakang pink. Di dalam `body`, ada konten utama yang menggunakan gradient warna pink dan diisi dengan elemen teks serta kartu fitur utama aplikasi. Tombol logout juga disediakan yang, saat ditekan, akan menghapus nama pengguna dari `SharedPreferences` dan membawa pengguna kembali ke halaman login.
 5._featureCard Function (Kartu Fitur)
Widget _featureCard(String title, String description) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    ),
  );
}
Fungsi `_featureCard` membuat tampilan kartu untuk setiap fitur utama aplikasi. Kartu ini berisi judul fitur dan deskripsi singkat, dengan tambahan efek bayangan (elevation) dan sudut membulat untuk tampilan yang lebih menarik.
 6.Logout Button (Tombol Keluar)
ElevatedButton(
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    backgroundColor: Colors.pink[400],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  ),
  onPressed: () async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    if (!mounted) return;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Loginpage()));
  },
  child: const Text('Logout', style: TextStyle(fontSize: 18)),
)
Tombol logout ini menggunakan `ElevatedButton` dengan latar belakang pink dan sudut membulat. Saat ditekan, nama pengguna akan dihapus dari `SharedPreferences`, dan pengguna akan diarahkan kembali ke halaman login (`Loginpage`).

c. Login_page.dart
1.Loginpage class
class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  LoginpageState createState() => LoginpageState();
}
`Loginpage` merupakan kelas yang menggunakan `StatefulWidget` karena membutuhkan interaksi dengan input pengguna (username dan password). Fungsi `createState` di sini digunakan untuk membuat state `LoginpageState` yang menangani logika dan tampilan halaman login.

2._saveusername
void _saveUsername() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('username', _usernameController.text);
}
Fungsi `_saveUsername` digunakan untuk menyimpan input username ke dalam `SharedPreferences`. Ini memungkinkan nama pengguna disimpan secara lokal dan digunakan kembali tanpa harus login ulang. Fungsi `setString` menyimpan username yang diambil dari `TextEditingController`.

3. _showinput
Widget _showInput(TextEditingController controller, String placeholder, bool isPassword) {
  return TextField(
    controller: controller,
    obscureText: isPassword,
    style: const TextStyle(color: Colors.black),
    decoration: InputDecoration(
      hintText: placeholder,
      hintStyle: const TextStyle(color: Colors.grey),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    ),
  );
}
Fungsi `_showInput` digunakan untuk membuat input field untuk username dan password. Fungsi ini menerima `controller` untuk mengontrol input teks, `placeholder` untuk memberi petunjuk kepada pengguna, dan `isPassword` untuk menentukan apakah input tersebut harus disembunyikan (jika password). Field ini memiliki dekorasi khusus dengan latar belakang putih, sudut membulat, dan padding agar tampil menarik.
4. Showdialog
void _showDialog(String message, Widget redirectPage) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(); // Tutup dialog
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => redirectPage),
              );
            },
          ),
        ],
      );
    },
  );
}
Fungsi `_showDialog` digunakan untuk menampilkan dialog pop-up dengan pesan tertentu. Dialog ini muncul setelah pengguna login, baik berhasil maupun gagal. Fungsi ini juga mengambil parameter `redirectPage`, yang menentukan halaman mana yang akan dituju setelah dialog ditutup. Saat tombol `Ok` ditekan, dialog akan ditutup dan pengguna akan diarahkan ke halaman tertentu.

5. Tampilan Login(build method)
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.pink, Colors.pink[200]!], 
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selamat Datang!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            _showInput(_usernameController, 'Masukkan Username', false),
            const SizedBox(height: 20),
            _showInput(_passwordController, 'Masukkan Password', true),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.pink[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                if (_usernameController.text == 'admin' && _passwordController.text == 'admin') {
                  _saveUsername();
                  _showDialog('Anda berhasil login', const Homepage());
                } else {
                  _showDialog('Username dan Password anda salah', const Loginpage());
                }
              },
            ),
          ],
        ),
      ),
    ),
  );
}
Pada metode `build`, seluruh antarmuka pengguna halaman login diatur. Konten utama berupa judul "Selamat Datang!" diikuti dengan dua field input untuk username dan password, yang dibuat menggunakan `_showInput`. Tombol `Login` memeriksa apakah username dan password yang dimasukkan benar (admin/admin). Jika benar, pengguna diarahkan ke halaman utama (`Homepage`), dan jika salah, dialog error akan muncul. Tata letak menggunakan `LinearGradient` dengan warna pink sebagai latar belakang untuk tampilan yang menarik.

d. sidemenu.dart
1. Sidemenu class
class Sidemenu extends StatelessWidget {
  const Sidemenu({super.key});
`Sidemenu` adalah kelas yang menggunakan `StatelessWidget`, yang berarti tidak memiliki state dinamis. Kelas ini berfungsi untuk membuat menu samping (drawer) di aplikasi.

2. Drawer widget (meu samping)
return Drawer(
  child: Column(
    children: [
Di dalam metode `build`, widget `Drawer` digunakan untuk membuat menu samping. `Drawer` ini berisi beberapa item menu yang ditempatkan dalam sebuah kolom (`Column`), yang menampilkan opsi navigasi ke berbagai halaman aplikasi.

3. Draw header
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
`DrawerHeader` adalah bagian atas menu samping yang berfungsi sebagai header. Bagian ini diatur dengan warna latar belakang pink dan teks putih bertuliskan "Menu Lainnya", dengan gaya teks berukuran besar dan tebal.

4. ListTile (item menu beranda)
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
Item menu pertama menggunakan widget `ListTile` dengan ikon rumah (`Icons.home`) dan teks "Beranda". Saat item ini ditekan, pengguna akan diarahkan ke halaman `Homepage` menggunakan `Navigator.pushReplacement` yang menggantikan halaman saat ini.

5. Listile (item menu tentang)
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
Item menu kedua menampilkan ikon informasi (`Icons.info`) dan teks "Tentang". Ketika ditekan, pengguna akan diarahkan ke halaman `AboutPage`. Sama seperti sebelumnya, `Navigator.pushReplacement` digunakan untuk mengganti halaman saat ini dengan halaman baru.

6. divider widget
const Divider(),
`Divider` adalah garis pemisah horizontal yang digunakan untuk memisahkan item-item dalam menu. Ini membantu memberikan tampilan yang lebih terorganisir pada menu.

7.ListTile widget
ListTile(
  leading: const Icon(Icons.exit_to_app),
  title: const Text('Keluar'),
  onTap: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Loginpage(),
      ),
    );
  },
),
Item terakhir pada menu samping adalah opsi "Keluar", dengan ikon pintu keluar (`Icons.exit_to_app`). Jika item ini ditekan, pengguna akan diarahkan kembali ke halaman login (`Loginpage`) menggunakan `Navigator.pushReplacement`.

### ScreenShoot
[Screenshoot 1](pertemuan3(1).png)
