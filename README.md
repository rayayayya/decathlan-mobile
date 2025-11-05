# Tugas Individu 7

## Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

Widget tree pada flutter adalah struktur hierarkis yang menyusun seluruh widget untuk membentuk UI suatu aplikasi. Perent widget merupakan widget yang berperan sebagai wadah untuk satu atau lebih widget lainnya, widget ini menentukan bagaimana widget child-nya akan ditampilkan. Child widget adalah widget yang berada pada widget parent, tampilan dan perilakunya akan diatur oleh parent widget.

## Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

## Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

Widget materialapp berfungsi sebagai widget rot yang menyediakan struktur dasar untuk aplikasi yang mengikuti prinsip material design. Widget ini sering digunakan karena mengatur konfigutasi penting di seluruh apalikasi, dengan menggunakan materialapp, kita dapat dengan lebih mudah memanage tampilan aplikasi.

## Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

Statelesswidget bersifat statis dan tidak dapat berubah setelah dibuat, penggunaan statelesswidget cocok saat ingin membuat UI yang tidak akan berubah sedangkan statefulwidget bersifat dinamis dan dapat berubah seiring waktu dengan interaksi pengguna, sehingga statefulwidget cocok untuk UI yang lebih interaktif

## Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

Buildcontext adalah penunjuk lokasi widget di dalam pohon widget flutter, berfungsi seabgai penyedia informasi konfigurasi. Penggunaannya dengan memanggil method build()

## Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Hot reload adalah fitur Flutter yang memungkinkan developer untuk meng-update UI secara instan tanpa kehilangan status aplikasi yang sedang berjalan, sedangkan hot restart menghentikan aplikasi, mengembalikan statusnya ke default, dan membangun ulang widget tree dari awal menggunakan kode baru yang telah dikompilasi