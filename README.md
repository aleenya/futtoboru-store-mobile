# Tugas 8


## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

**Navigator.push()**

- Menambah halaman baru di atas stack
- Halaman lama tidak dihapus
- User bisa balik ke halaman sebelumnya dengan Navigator.pop()
- Contoh penggunaannya saat dari Home -> All Products, setelah user melihat All Products bisa langsung back ke Home


**Navigator.pushReplacement()**

- Mengganti halaman lama dengan halaman baru
- Halaman lama dihapus dari stack
- User tidak bisa balik ke halaman sebelumnya 
- Contoh penggunaannya saat Submit Form, setelah itu tidak bisa kembali ke bagian pengisian Form dengan tombol back



## Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

- **Scaffold**: Digunakan sebagai kerangka dasar halaman, menyediakan struktur umum seperti AppBar, Drawer, dan body. Ini memastikan konsistensi tata letak di seluruh aplikasi.

- **AppBar**: Ditempatkan di bagian atas Scaffold, memberikan judul halaman dan navigasi utama. Ini membantu pengguna mengenali halaman yang sedang mereka akses.

- **Drawer**: Disediakan di Scaffold untuk navigasi samping, memungkinkan pengguna mengakses berbagai bagian aplikasi dengan mudah. Ini menjaga konsistensi navigasi di seluruh aplikasi. Contoh: Setiap halaman di aplikasi Football Shop memiliki AppBar dengan judul yang sesuai dan Drawer yang sama untuk navigasi ke halaman lain seperti Home, All Products, dan Cart.   



## Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

- **Padding**: Memberikan ruang di sekitar elemen form, membuat UI lebih rapi dan mudah dibaca. Contoh: Menambahkan Padding di sekitar TextField untuk menghindari elemen yang terlalu rapat.

- **SingleChildScrollView**: Memungkinkan konten form yang panjang untuk di-scroll, sehingga user dapat mengakses semua elemen tanpa terpotong. Contoh: Menggunakan SingleChildScrollView untuk seluruh form pendaftaran agar pengguna dapat menggulir ke bawah jika form terlalu panjang.

- **ListView**: Menyediakan cara yang efisien untuk menampilkan daftar elemen form yang dinamis, seperti daftar produk atau opsi pilihan. Contoh: Menggunakan ListView untuk menampilkan daftar produk di halaman All Products, sehingga pengguna dapat melihat semua produk dengan mudah.



## Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Saya menyesuaikan warna tema agar tampilannya konsisten di seluruh halaman aplikasi (pink). Setiap elemen seperti AppBar, tombol, dan ikon menggunakan warna yang senada supaya aplikasi terlihat rapi dan punya gaya visual yang sama.