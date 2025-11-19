import 'package:decathlan_mobile/widgets/left_drawer.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:decathlan_mobile/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _description = "";
  String _category = "";
  String _thumbnail = "";

   final List<String> _categories = [
    'football',
    'basketball',
    'badminton',
    'running',
    'training',
    'cycling',
    'swimming',
    'tennis',
    'golf',
    'outdoor',
    'fitness',
    'yoga',
    'skateboarding',
    'surfing',
    'hiking',
    'climbing',
    'water_sports',
    'winter_sports',
    'other',
  ];
  
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add New Product')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(key: _formKey, 
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
    children:[
      // === Title ===
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Nama Produk",
            labelText: "Nama Produk",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          onChanged: (String? value) {
            setState(() {
              _name = value!;
            });
          },
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return "Judul tidak boleh kosong!";
            }
            return null;
          },
        ),
      ),
       Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      maxLines: 5,
      decoration: InputDecoration(
        hintText: "Deskripsi Produk",
        labelText: "Deskripsi Produk",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onChanged: (String? value) {
        setState(() {
          _description = value!;
        });
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Deskripsi produk tidak boleh kosong!";
        }
        return null;
      },
    ),
  ),

  // === Category ===
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Kategori",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      value: _category.isEmpty ? null : _category,
      items: _categories
          .map((cat) => DropdownMenuItem(
                value: cat,
                child: Text(
                    cat[0].toUpperCase() + cat.substring(1)),
              ))
          .toList(),
      onChanged: (String? newValue) {
        setState(() {
          _category = newValue!;
        });
      },
    ),
  ),

  // === Thumbnail URL ===
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "URL Thumbnail (opsional)",
        labelText: "URL Thumbnail",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onChanged: (String? value) {
        setState(() {
          _thumbnail = value!;
        });
      },
    ),
  ),
    // === Tombol Simpan ===
    Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Colors.indigo),
          ),onPressed: () async {
            if (_formKey.currentState!.validate()) {
              final response = await request.postJson(
                // GANTI dengan URL backend kamu
                "http://localhost:8000/create-flutter/",
                jsonEncode({
                  "name": _name,
                  "description": _description,
                  "category": _category,
                  "thumbnail": _thumbnail,
                  "price": 0,           // kalau belum ada input price di form
                  "stock": 0,           // kalau belum ada input stock
                  "brand": "",          // kalau belum ada input brand
                }),
              );

              if (context.mounted) {
                if (response['status'] == 'success') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Product successfully saved!")),
                  );

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Something went wrong, please try again."),
                    ),
                  );
                }
              }
            }
          },

          
          
          child: const Text(
            "Save",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
  ],
        )
      )),
    );
  }
}
