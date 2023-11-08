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
  ```agsl
  class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
  }
  ```
  * Menambahkan list ShopItem pada widget MyHomePage
  ```agsl
    final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Colors.blueGrey),
    ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.green),
    ShopItem("Logout", Icons.logout, Colors.red),
  ];
  ```
* Menambahkan Card untuk display ShopItem dan implement on click show SnackBar
  ```agsl
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
