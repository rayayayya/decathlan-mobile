import 'package:decathlan_mobile/widgets/left_drawer.dart';
import 'package:flutter/material.dart';

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
      value: _category,
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
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Produk berhasil tersimpan'),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                           Text('Nama: $_name'),
                            Text('Deskripsi: $_description'),
                            Text('Kategori: $_category'),
                            Text('Thumbnail: $_thumbnail'),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.pop(context);
                          _formKey.currentState!.reset();
                        },
                      ),
                    ],
                  );
                },
              );
           
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
