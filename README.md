# Tugas Individu 7

## Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

Widget tree pada flutter adalah struktur hierarkis yang menyusun seluruh widget untuk membentuk UI suatu aplikasi. Perent widget merupakan widget yang berperan sebagai wadah untuk satu atau lebih widget lainnya, widget ini menentukan bagaimana widget child-nya akan ditampilkan. Child widget adalah widget yang berada pada widget parent, tampilan dan perilakunya akan diatur oleh parent widget.

## Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

1. Stateless widget: Memberikan struktur dasar aplikasi berbasis Material Design, termasuk tema, navigasi, dan struktur halaman.
2. Scaffold: Memberikan struktur halaman standar Material Design
3. Appbar: Menampilkan bagian header
4. Snackbar: Menampilkan pesan sementara di bagian bawah layar sebagai umpan balik pengguna
5. Container: Membungkus isi dalam ItemCard
## Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

Widget materialapp berfungsi sebagai widget rot yang menyediakan struktur dasar untuk aplikasi yang mengikuti prinsip material design. Widget ini sering digunakan karena mengatur konfigutasi penting di seluruh apalikasi, dengan menggunakan materialapp, kita dapat dengan lebih mudah memanage tampilan aplikasi.

## Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

Statelesswidget bersifat statis dan tidak dapat berubah setelah dibuat, penggunaan statelesswidget cocok saat ingin membuat UI yang tidak akan berubah sedangkan statefulwidget bersifat dinamis dan dapat berubah seiring waktu dengan interaksi pengguna, sehingga statefulwidget cocok untuk UI yang lebih interaktif

## Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

Buildcontext adalah penunjuk lokasi widget di dalam pohon widget flutter, berfungsi seabgai penyedia informasi konfigurasi. Penggunaannya dengan memanggil method build()

## Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Hot reload adalah fitur Flutter yang memungkinkan developer untuk meng-update UI secara instan tanpa kehilangan status aplikasi yang sedang berjalan, sedangkan hot restart menghentikan aplikasi, mengembalikan statusnya ke default, dan membangun ulang widget tree dari awal menggunakan kode baru yang telah dikompilasi


# Tugas Individu 8

## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

Navigator.push() memungkinakn user untuk membuka halaman sementara dan user dapat kembali ke halaman sebelumnya, sedangkan, Navigator.pushReplacement() menggantikan halaman sebelumnya, jadi halaman lama tidak dapat dikembalikan lagi dengan tombol back.

Penggunaan Navigator.push() cocok ketika kita ingin user dapat balik ke halaman sebelumnya, sedangkan Navigator.pushReplacement() cocok saat kita tidak ingin user baliik ke halaman sebelumnya

## Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Scaffold memungkinkan untuk menampuk struktur halaman, menentukan posisi appbar, dan menyediakan drawer di samping.D Dengan menggunakan scaffold, semua halaman memiliki layout dasar yang sama
Appbar digunakan untuk membuat judul halaman dan juga tempat tombol navigasi seperti icon back
Drawer berisisi navigasi ke halaman halaman utama dalam aplikasi

## Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Padding digunakan untuk memberi jarak antar elemen di layar, kelebihannya adalah form jadi terlihat lebih rapi dan teratur, SingleChildScrollView memungkinkan seluruh isi halaman di scroll apabila isinya melebihi tinggi dari layar, ListView memungkinkan untuk menambilkan banyak elemen secara dinamis dibandingkan dengan penggunaan column
## Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Pengaturan warna tema aplikasi dilakukan pada bagian

<pre> ```dart theme: ThemeData( colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue) .copyWith(secondary: Colors.blueAccent[400]), ), home: MyHomePage(), ``` </pre>

# Tugas Individu 9

## Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

Kita perlu membuat model dart supaya data punya struktur jelas, tipe aman, dan mudah dipakai.

Apabila kita langsung pakai Map<String, dynamic> maka ada beberapa hal yang akan terjadi, seperti rawan runtime error karena tidak ada validasi tipe, data null bisa membuat crash karena nullsafety hilang, typo key JSON yang tidak terdeteksi karena lebih sulit untuk dimaintain dan kodenya cepat berantakan
Tidak ada validasi tipe → rawan runtime error.

## Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

http untuk request standar (GET/POST) tanpa session dan tanpa cookie
CookieRequest request yang membawa cookie/session, dipakai untuk login terauthenticate

## Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Karena session login tersimpan di dalam CookieRequest, bukan global

Kalau tiap halaman bikin instance baru maka session hilang, user dianggap belum login,
request ke Django ditolak

## Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

10.0.2.2 di ALLOWED_HOSTS = agar Android emulator bisa mengakses Django di localhost.
CORS enabled = agar Flutter boleh mengakses Django dari domain berbeda.
SameSite + cookie settings = supaya cookie login tidak diblok oleh browser/emulator.
Android permission Internet = tanpa ini app Android tidak bisa melakukan HTTP request.

Kalau tidak dikonfigurasi maka request ditolak Django (“disallowed host”) dan flutter tidak bisa connect ke server sama sekali

## Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

User isi form di Flutter.
Flutter kirim data (POST) ke Django.
Django proses & simpan ke database.
Flutter fetch data lagi (GET).
Data JSON diterjemahkan ke model Dart.
Ditampilkan ke UI Flutter.

## Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Register:

Flutter kirim data akun → Django
Django buat user baru
Flutter mendapat response sukses

Login:

Flutter kirim username/password via CookieRequest
Django cek credential
Jika benar maka Django kirim session cookie
CookieRequest menyimpan cookie
Flutter pindah ke halaman menu (authenticated)

Logout:

Flutter kirim request logout (CookieRequest)
Django hapus session
CookieRequest bersihkan cookie
Flutter kembali ke halaman login

## Melakukan tugas step by step

1. Mengimplementasikan Fitur Registrasi, Login dan cara mengintegrasikan dengan flutter

Membuat app baru bernama authentication yang memiliki function login, register, dan logout pada django dan membuat file baru bernama login dan register di flutter lalu untuk intergasi dengan flutter Integrasi dilakukan dengan menggunakan package pbp_django_auth. Di file main.dart, wrap aplikasi dengan Provider yang menyediakan instance CookieRequest ke seluruh widget tree.

2. Membuat model kustom

Untuk membuat model kustom, pertama akses endpoint JSON dari Django yang sudah dideploy, lalu copy response JSON-nya. Lalu copy kode yang dihasilkan dan simpan di file baru bernama product_entry.dart dalam folder models. Model ini berisi class Product dengan property pk dan fields, serta class Fields yang berisi semua atribut product seperti name, price, description, image, category, stock, brand, views, dan user. Model ini juga dilengkapi dengan method fromJson() untuk parsing JSON menjadi object Dart dan toJson() untuk sebaliknya.

3. Membuat Halaman Daftar Item

Membuat halaman ProductListPage yang menggunakan FutureBuilder untuk fetch data dari endpoint JSON Django. Di dalam fungsi fetchProduct(), menggunakan request.get() untuk mengambil data product. Data yang sudah diparsing disimpan dalam list. Widget FutureBuilder akan menampilkan loading indicator saat data sedang di-fetch, menampilkan pesan jika data kosong, atau menampilkan ListView.builder yang berisi card untuk setiap product. Setiap card menampilkan thumbnail, name, price, category, dan description product. Card ini dibungkus dengan InkWell agar bisa diklik untuk navigasi ke halaman detail.

4. Membuat Halaman Detail Item
Halaman detail dibuat dengan class ProductDetailPage yang menerima parameter Product dari halaman list. Halaman ini menampilkan semua atribut product secara lengkap menggunakan SingleChildScrollView agar bisa di-scroll jika konten panjang. Di bagian atas ditampilkan image product dalam ukuran lebih besar, diikuti dengan name dan price dengan styling yang menonjol. Kemudian ditampilkan informasi lain seperti category, brand, stock, dan views menggunakan Row dengan icon di sebelah kirinya agar lebih informatif. Description ditampilkan dalam paragraf penuh dengan text align justify. Di bagian bawah ada tombol "Back to Product List" yang ketika ditekan akan memanggil Navigator.pop() untuk kembali ke halaman list product.

5. Dengan mengubah bagian
product_list = Product.objects.all().order_by('-id') menjadi
user = request.user
product_list = Product.objects.filter(user=user).order_by('-id')

pada show_json di views.py