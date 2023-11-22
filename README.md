# iStock - mobile
<hr>

Nama: Steven Faustin Orginata <br>
Kelas: PBP C <br>
NPM: 2206030855 <br>

<h2>Tugas 7 PBP Ganjil 2023/2024</h2>

* Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
* Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
* Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

<hr>

<h4>1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?</h4>
Stateful widgets adalah widgets yang dapat berubah selama runtime. Contohnya adalah Form, RadioButton, Checkbox,
dan widgets lain yang bisa berubah selama aplikasi berjalan. <br>
Stateless widgets adalah widgets yang tidak akan berubah selama aplikasi berjalan. Contohnya adalah Text, dan widgets lain yang tidak
bisa berubah selama aplikasi berjalan. <br>

<h4>2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.</h4>

* Pada main.dart:
  * MyApp: berfungsi sebagai aplikasi utama.
  * MaterialApp: berfungsi untuk set title dan tema aplikasi.
  * ThemeData: berfungsi untuk set tema aplikasi.
  * MyHomePage: berfungsi sebagai widget home page.

* Pada menu.dart:
  * Scaffold: berfungsi sebagai container dengan ukuran _fit-content_ / mengambil space sebanyak yang ada.
  * AppBar: berfungsi sebagai komponen yang berisi title dan terletak di paling atas aplikasi
  * Text: berfungsi sebagai widget untuk menampilkan text
  * TextStyle: berfungsi sebagai widget untuk meng-custom text
  * SingleChildScrollView: berfungsi sebagai widget yang memungkinkan single scroll secara vertikal
  * Padding: berfungsi sebagai widget untuk men-set padding suatu widget
  * GridView: berfungsi untuk menerapkan grid layout pada aplikasi.
  * ShopCard: widget yang dibuat developer untuk menampilkan tombol Lihat Item, Tambah Item, dan Logout.
  * Material: berfungsi untuk membuat sebuah user interfaces pada aplikasi.
  * InkWell: berfungsi untuk memberikan onTap response pada widget parent nya
  * SnackBar: berfungsi untuk menampilkan / pop-up message kepada user
  * Container: berfungsi sebagai container
  * Center: berfungsi untuk men-center widget child nya
  * Column: berfungsi untuk set layout pada widget child nya
  * Icon: berfungsi untuk menampilkan icon

<h4>3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)</h4>

* Membuat project flutter
  * cd ke directory yang diinginkan
  ```agsl
  <path_direktori> flutter create istock
  cd istock
  ```
* Memisahkan code dari main.dart ke menu.dart
  * HomePage pada main.dart dipindahkan ke menu.dart sehingga pada main.dart hanya call MyHomePage()
  * lakukan import menu.dart di main.dart agar MyHomePage bisa dipanggil
* Menambahkan ShopItem
  * Membuat class ShopItem (color dipakai untuk men-generate warna yang berbeda)
  ```
  class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
  }
  ```
  * Menambahkan list ShopItem pada widget MyHomePage
  ```
    final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Colors.blueGrey),
    ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.green),
    ShopItem("Logout", Icons.logout, Colors.red),
  ];
  ```
* Menambahkan Card untuk display ShopItem dan implement on click show SnackBar
  ```
  class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key});

    @override
    Widget build(BuildContext context) {
      return Material(
        color: item.color,
        child: InkWell(
          onTap: () {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  content: Text("Kamu telah menekan tombol ${item.name}")));
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item.icon,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  const Padding(padding: EdgeInsets.all(3)),
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
  ```
<hr>

<h2>Tugas 8 PBP Ganjil 2023/2024</h2>

* Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
* Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
* Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
* Bagaimana penerapan clean architecture pada aplikasi Flutter?
* Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

<hr>

<h4>1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!</h4>
Navigator.push adalah method untuk menimpa/menambahkan halaman pada top of stack. Jika pengguna meng klik tombol back, akan dilakukan operasi pop pada stack dan pengguna akan kembali ke halaman awal sebelum membuka halaman baru tadi. <br>
Navigator.pushReplacement adalah method untuk replace halaman pengguna sekarang. Operasi yang dilakukan adalah pop kemudian push halaman baru. Ketika pengguna meng klik back, akan dilakukan operasi pop dan pengguna tidak akan kembali ke halaman awal sebelum membuka halaman baru tadi. <br>
Contoh penggunaan navigator.push: saat user ingin melihat item di aplikasi. <br>
Contoh penggunaan navigator.pushreplacement: saat user ingin login. Ketika user sudah ada di main, tetapi meng-klik back, user tidak mungkin masuk lagi ke halaman login.

<h4>2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!</h4>

1. Single-child layout widgets
   * Align: align child dengan dirinya.
   * AspectRatio: memberikan ukuran berdasarkan aspect ratio pada child.
   * Baseline: Container yang menempatkan child berdasarkan baseline child tersebut
   * Center: align center child dengan dirinya.
   * ConstrainedBox: menambahkan constraint pada child
   * Container: Widget untuk menyimpan, menambah, mengombinasikan, menempatkan, dan memberi ukuran pada child
   * Padding: memberikan padding pada child
   * SizedBox: memberikan ukuran spesifik pada child
   * Transform: memberikan transformasi pada child
2. Multi-child layout widgets
   * Column: menempatkan child secara vertikal
   * GridView: menempatkan child sesuai index vertikal dan horizontal
   * ListView: menempatkan child secara vertikal, namun bisa di scroll oleh pengguna
   * Row: menempatkan child secara horizontal
   * Stack: menempatkan child secara bertumpuk
- diambil dari https://docs.flutter.dev/ui/widgets/layout

<h4>3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!</h4>
Pada tugas ini, saya menggunakan elemen input TextFormField untuk menerima input. Elemen ini digunakan agar bisa mengimplementasikan fitur validasi input.
Selain itu, elemen input ini juga dipakai agar terintegrasi dengan widget Form.

<h4>4. Bagaimana penerapan clean architecture pada aplikasi Flutter?</h4>
Pada tugas ini, saya menerapkan clean architecture pada Flutter dengan mengelompokkan file berdasarkan kegunannya masing".
Contoh, pada folder screens berisi file yang merupakan tampilan screen. Pada folder widgets berisi file yang merupakan widgets yang bisa dipakai di screens.
Pengelompokkan file ini disebut sebagai refactoring file dalam konteks clean architecture.

<h4>5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)</h4>

1. Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:
    
    ```
    class ItemFormPage extends StatefulWidget {
    const ItemFormPage({super.key});

    @override
    State<ItemFormPage> createState() => _ItemFormPageState();
    }

    List<Item> items = [];

    class _ItemFormPageState extends State<ItemFormPage> {}
    ```
   * Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.
   ```
    String _name = "";
    int _amount = 0;
    String _type = ""; // sesuai model Django
    String _description = "";
   
   // input widget
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Nama Item",
                    labelText: "Nama Item",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                    ),
                ),
                onChanged: (String? value) {
                    setState(() {
                        _name = value!;
                    });
                }
        )
   ```
   * Memiliki sebuah tombol Save.
   ```
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black87),
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
   ```
   * Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:
        * Setiap elemen input tidak boleh kosong.
        * Setiap elemen input harus berisi data dengan tipe data atribut modelnya.
   ```
   // salah satu input validator
   ...
                onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
   ...
   ```
2.  Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.
    ```
    tambahkan di item_card.dart saat init card
          if (item.name == "Tambah Item") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ItemFormPage()),
            );
          }
    ```
3. Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
Ditambahkan di funtion onPressed() pada ElevatedButton
    ```
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Item berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    Text('Amount: $_amount'),
                                    Text('Tipe: $_type'),
                                    Text('Deskripsi: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          }
                        );
    ```
4. Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:
   * Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.
   * Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.
   * Ketika memiih opsi (Tambah Item), maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.
    ```
    import 'package:flutter/material.dart';
    import 'package:istock/screens/menu.dart';
    import 'package:istock/screens/istock_form.dart';
    import 'package:istock/screens/istock_item.dart';
    
    class LeftDrawer extends StatelessWidget {
      const LeftDrawer({super.key});
    
      @override
      Widget build(BuildContext context) {
        return Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black87,
                ),
                child: Column(
                  children: [
                    Text(
                      'iStock',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Text("Your Go-To Inventory App",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Halaman Utama'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.checklist),
                title: const Text('Lihat Item'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const ViewItemPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_shopping_cart),
                title: const Text('Tambah Item'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const ItemFormPage()),
                  );
                },
              ),
            ],
          ),
        );
      }
    }
    ```
<h2>Tugas 9 PBP Ganjil 2023/2024</h2>

* Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
* Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
* Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
* Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
* Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
* Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

<h4>1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?</h4>
Bisa, tetapi data akan lebih mudah divalidasi dan disimpan dengan menggunakan model.

<h4>2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.</h4>
Sesuai namanya yaitu, CookieRequest, berfungsi untuk mengambil cookie pada web. CookieRequest dibagikan ke semua komponen agar state setiap komponen sama.

<h4>3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.</h4>
Data diambil dari endpoint /json/ pada web yang telah di deploy. Dari hasil json tersebut kemudian di decode, lalu dibuat menjadi model dengan method fromJson. Model ini kemudian bisa ditampilkan di Flutter

<h4>4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.</h4>
Pada flutter, user memasukkan username dan password. Kedua data tersebut kemudian di pass ke endpoint autentikasi django pada web yang telah di deploy. Dari endpoint ini akan di return apakah pengguna berhasil login atau tidak.
Jika user berhasil login, maka menu bisa ditampilkan. Jika tidak, maka user tidak bisa mengakses menu.

<h4>5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.</h4>

* Pada main.dart:
    * MyApp: berfungsi sebagai aplikasi utama.
    * MaterialApp: berfungsi untuk set title dan tema aplikasi.
    * ThemeData: berfungsi untuk set tema aplikasi.
    * MyHomePage: berfungsi sebagai widget home page.

* Pada menu.dart:
    * Scaffold: berfungsi sebagai container dengan ukuran _fit-content_ / mengambil space sebanyak yang ada.
    * AppBar: berfungsi sebagai komponen yang berisi title dan terletak di paling atas aplikasi
    * Text: berfungsi sebagai widget untuk menampilkan text
    * TextStyle: berfungsi sebagai widget untuk meng-custom text
    * SingleChildScrollView: berfungsi sebagai widget yang memungkinkan single scroll secara vertikal
    * Padding: berfungsi sebagai widget untuk men-set padding suatu widget
    * GridView: berfungsi untuk menerapkan grid layout pada aplikasi.
    * ShopCard: widget yang dibuat developer untuk menampilkan tombol Lihat Item, Tambah Item, dan Logout.
    * Material: berfungsi untuk membuat sebuah user interfaces pada aplikasi.
    * InkWell: berfungsi untuk memberikan onTap response pada widget parent nya
    * SnackBar: berfungsi untuk menampilkan / pop-up message kepada user
    * Container: berfungsi sebagai container
    * Center: berfungsi untuk men-center widget child nya
    * Column: berfungsi untuk set layout pada widget child nya
    * Icon: berfungsi untuk menampilkan icon
  
* Pada file lain:
    * TextButton: Button dengan text

<h4>6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).</h4>
- Membuat halaman login pada proyek tugas Flutter. <br>
    membuat file dart untuk login page
- 
    ```
    import 'package:istock/screens/menu.dart';
    import 'package:flutter/material.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';
    
    void main() {
      runApp(const LoginApp());
    }
    
    class LoginApp extends StatelessWidget {
      const LoginApp({super.key});
    
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Login',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LoginPage(),
        );
      }
    }
    
    class LoginPage extends StatefulWidget {
      const LoginPage({super.key});
    
      @override
      _LoginPageState createState() => _LoginPageState();
    }
    
    class _LoginPageState extends State<LoginPage> {
      final TextEditingController _usernameController = TextEditingController();
      final TextEditingController _passwordController = TextEditingController();
    
      @override
      Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
          ),
          body: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(height: 12.0),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () async {
                    String username = _usernameController.text;
                    String password = _passwordController.text;
    
                    // Cek kredensial
                    // Untuk menyambungkan Android emulator dengan Django pada localhost,
                    // gunakan URL http://10.0.2.2/
                    final response = await request.login("https://steven-faustin-tugas.pbp.cs.ui.ac.id/auth/login/", {
                      'username': username,
                      'password': password,
                    });
    
                    if (request.loggedIn) {
                      String message = response['message'];
                      String uname = response['username'];
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Login Gagal'),
                          content:
                          Text(response['message']),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        );
      }
    }
    ```
- Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.<br>
    Membuat views.py untuk handle autentikasi pada main app Django.
    Kemudian, flutter akan mengirim data ke endpoint tersebut untuk dihandle oleh Django

- Membuat model kustom sesuai dengan proyek aplikasi Django. <br>
    Mengambil data json melalui endpoint /json/ pada web. Data tersebut di copy paste ke Quicktype untuk diubah menjadi class Item.

- Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy. <br>
    Mengambil data yang ada melalui endpoint /json/ kemudian di parse ke model yang telah dibuat.
    Dari hasil parse tersebut dapat di map / loop untuk ditampilkan.

<hr>