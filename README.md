# Tugas 9


##  Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
- Model Dart memberikan type safety sehingga data yang diterima/dikirim mengikuti tipe yang benar.
- Menghindari error runtime akibat salah key atau tipe data ketika memakai Map<String, dynamic>.
- Memaksimalkan null-safety, karena setiap field dapat diatur apakah wajib (required) atau boleh null.
- Model memudahkan maintainability, karena perubahan struktur JSON cukup diperbarui di satu tempat (fromJson, toJson).
- Kode lebih bersih, terstruktur, mudah dibaca, dan lebih aman untuk proyek skala menengah/besar.



## Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
http
- Digunakan untuk melakukan request HTTP dasar seperti GET dan POST.
- Cocok untuk endpoint publik atau yang tidak memerlukan autentikasi.
- Tidak mengelola cookie maupun session secara otomatis.


CookieRequest
- Dipakai untuk autentikasi menggunakan cookie session Django.
- Menyimpan cookie sessionid dan mengirimkannya otomatis pada setiap request berikutnya.
- Digunakan untuk login, logout, register, serta mengakses endpoint yang membutuhkan autentikasi.


Perbedaan
- http: stateless, tidak menyimpan session, untuk endpoint umum.
- CookieRequest: stateful, menyimpan cookie session, khusus untuk autentikasi Django.



## Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
- Menjamin status login konsisten di seluruh aplikasi (satu session untuk semua halaman).
- Semua widget yang melakukan request autentikasi harus memakai session/cookie yang sama.
- Menghindari masalah seperti halaman tertentu tidak mengenali login karena memakai instance berbeda.
- Mempermudah logout, karena perubahan status login langsung terlihat oleh seluruh widget.



## Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
- 10.0.2.2 di ALLOWED_HOSTS → Emulator Android mengakses host melalui alamat ini, bukan localhost.
- CORS diaktifkan → Mengizinkan aplikasi Flutter mengakses server Django dari origin berbeda.
- Pengaturan SameSite/cookie → Agar cookie Django (session) dapat dikirim/diterima dengan benar.
- Izin internet di AndroidManifest → Tanpa izin ini, Flutter tidak dapat melakukan request HTTP.


Jika konfigurasi salah:
- Request akan ditolak (DisallowedHost).
- Cookie session tidak terkirim → login tidak berfungsi.
- Request gagal total (tanpa izin internet).
- Aplikasi tidak bisa berkomunikasi dengan backend.



## Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
1. Pengguna memberikan input atau membuka halaman yang butuh data.
2. Flutter mengirim request (GET/POST) ke Django melalui http atau CookieRequest.
3. Django memproses request, mengambil data dari database, lalu merespons dalam format JSON.
4. Flutter menerima JSON, mendecode, lalu memetakan ke model Dart (fromJson).
5. Data disimpan dalam state dan ditampilkan di widget (ListView, card, dll).


## Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Register:
- Flutter mengirim data ke endpoint register Django.
- Django memvalidasi dan membuat akun baru.
- Flutter menampilkan status berhasil/gagal.


Login:
- Flutter mengirim username & password via CookieRequest.login().
- Django mengecek kredensial dan membuat session.
- Cookie session dikirim ke Flutter dan disimpan di CookieRequest.
- Flutter menampilkan menu/homescreen sesuai status login.


Akses setelah login:
- Flutter mengirim request memakai CookieRequest sehingga session ikut terkirim.
- Django mengenali user melalui cookie dan mengirim data khusus user terkait.


Logout:
- Flutter memanggil request.logout().
- Django menghapus session.
- CookieRequest menghapus cookie lokal, status login jadi false.


## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
1. Deployment Django: Membuat model, migrasi, admin, dan endpoint JSON. Tes endpoint hingga berjalan.
2. Model Django: Menambahkan field item (name, price, description, thumbnail, category, is_featured, user).
3. Endpoint JSON: Membuat view untuk list item & detail item, termasuk filter berdasarkan user login.
4. Konfigurasi Django: Menambahkan 10.0.2.2, mengaktifkan CORS, mengatur cookie/session.
5. Konfigurasi Flutter: Menambahkan dependency http dan pbp_django_auth; menginisialisasi CookieRequest dengan Provider.
6. Model Dart: Membuat class Item beserta fromJson & toJson.
7. Halaman Login & Register: Membuat form Flutter lalu kirim data ke Django via CookieRequest.
8. Halaman Daftar Item:
- Fetch data dari endpoint JSON Django.
- Parsing ke model Dart.
- Menampilkan dalam ListView/GridView dengan card.
9. Halaman Detail Item:
- Navigasi dari card item ke halaman detail.
- Menampilkan seluruh atribut item.
- Menambahkan tombol kembali.
10. Filter Item by User:
- Mengatur Django supaya hanya mengembalikan item milik user login.
- Memastikan Flutter mengakses dengan CookieRequest.