# Tugas 7


## Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

Widget tree bisa digambarkan seperti data type Tree, di mana setiap node adalah widget. Artinya, akan ada suatu widget parent yang memiliki satu atau lebih widget child-nya dan widget child tersebut juga bisa mempunyai child sendiri. Hubungan parent-child pada widget bekerja mirip konsep OOP, apa yang ada di parent akan dimiliki child. Misal, parent widget memiliki alignment center, maka semua child widget nya juga akan memiliki alignment center.



## Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

- MaterialApp
Sebagai root aplikasi Flutter. Mengatur tema, judul aplikasi, dan menentukan halaman awal (MyHomePage).

- Scaffold
Menyediakan struktur dasar halaman seperti AppBar di atas dan body di bawahnya.

- AppBar
Menampilkan judul “Futtoboru Shop” di bagian atas layar.

- Center
Meletakkan konten utama (Column) di tengah layar secara vertikal dan horizontal.

- Column
Menyusun elemen-elemen (seperti teks identitas dan grid menu) secara vertikal.

- Text
Menampilkan tulisan, seperti nama, NPM, dan kelas mahasiswa di bagian atas halaman.

- GridView.count
Menampilkan daftar menu dalam bentuk grid (kotak-kotak) dua kolom.

- Material
Memberi tampilan dan efek Material Design pada setiap kotak menu (termasuk warna latar belakang sesuai item).

- InkWell
Menjadikan kotak menu bisa ditekan dan menampilkan efek ripple saat diklik.

- Icon
Menampilkan ikon pada setiap menu (seperti store, article, add_circle) sesuai fungsi tombolnya.

- ItemHomepage (custom widget/model)
Kelas buatan sendiri untuk menyimpan data tiap menu, yaitu nama, ikon, dan warna masing-masing tombol.



## Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
 
MaterialApp adalah widget yang mengaktifkan Material Design di aplikasi. Widget ini menyediakan title, theme, home, routes, initialRoute, pengaturan navigator, dll. Sering digunakan sebagai widget root karena banyak widget lain (seperti Scaffold, AppBar, dll) membutuhkan hal-hal yang disediakan MaterialApp.
 
 

## Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
 
**Stateless Widget**

Tidak punya state yang berubah dalam widget tersebut. UI hanya bergantung pada data dari parameter yang tidak akan berubah setelah di-build kecuali parent rebuild dengan data baru. 
 
Contoh: Text statis, icon, tombol yang fungsinya di-handle parent.

 
**Stateful Widget**

Punya state internal yang bisa berubah seperti toggle, counter, input user. Saat state berubah, akan dipanggil setState() yang mana Flutter akan rebuild bagian tersebut.

Contoh: checkbox, textfield.

 

## Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalah objek yang merepresentasikan posisi suatu widget di dalam widget tree. Digunakan   untuk mengambil data/layanan dari widget di atasnya.

Contoh:
Theme.of(context) → ambil tema.
Navigator.of(context) → navigasi antar halaman.
MediaQuery.of(context) → info ukuran layar, orientasi, dsb.


 
## Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Hot reload adalah update kode yang berubah dan rebuild widget tree tanpa menghapus state yang sedang jalan.

Contoh: ada counter yang sudah bernilai 10, lalu saat diubah warna tombol, counter tetap 10.