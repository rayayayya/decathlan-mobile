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
