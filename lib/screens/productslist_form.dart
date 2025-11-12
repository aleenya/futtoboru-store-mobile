import 'package:flutter/material.dart';
import 'package:futtoboru_store/widgets/left_drawer.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Model fields
  String _name = "";
  int _price = 0;
  String _description = "";
  String _thumbnail = "";
  int _stock = 0;
  String _category = "others";
  String _color = "white";
  String _size = "S/38";
  bool _isFeatured = false;

  final List<String> _categories = [
    'jersey',
    'sportswear',
    'footwear',
    'accessories',
    'others',
  ];

  final List<String> _colors = [
    'black','white','red','blue','yellow','green','gold','purple','pink',
  ];

  final List<String> _sizes = ['S/38','M/39','L/40','XL/41','XXL/42'];

  bool _validUrl(String v) {
    final u = Uri.tryParse(v);
    return u != null && (u.scheme == 'http' || u.scheme == 'https') && u.host.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Form Tambah Produk')),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Name ===
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
                  onChanged: (value) => _name = value,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) return "Nama tidak boleh kosong!";
                    if (value.length < 3) return "Nama minimal 3 karakter.";
                    return null;
                  },
                ),
              ),

              // === Description ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Deskripsi Produk",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => _description = value,
                 validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === Price ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Harga Produk",
                    labelText: "Harga Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => _price = int.tryParse(value) ?? 0,
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Harga produk tidak boleh kosong!";
                    final harga = int.tryParse(value);
                    if (harga == null) return "Harga produk harus berupa angka.";
                    if (harga < 0) return "Harga tidak boleh negatif!";
                    return null;
                  },
                ),
              ),

              // === Stock ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Stok Produk",
                    labelText: "Stok",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => _stock = int.tryParse(value) ?? 0,
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Stok tidak boleh kosong!";
                    final s = int.tryParse(value);
                    if (s == null) return "Stok harus berupa angka.";
                    if (s < 0) return "Stok tidak boleh negatif.";
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
                  initialValue: _category, // pakai initialValue biar bebas warning di SDK kamu
                  items: _categories
                      .map((cat) => DropdownMenuItem(
                            value: cat,
                            child: Text(cat[0].toUpperCase() + cat.substring(1)),
                          ))
                      .toList(),
                  onChanged: (newValue) => setState(() => _category = newValue!),
                ),
              ),

              // === Color ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Warna",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _color,
                  items: _colors
                      .map((c) => DropdownMenuItem(value: c, child: Text(c[0].toUpperCase() + c.substring(1))))
                      .toList(),
                  onChanged: (newValue) => setState(() => _color = newValue!),
                ),
              ),

              // === Size ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Ukuran",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _size,
                  items: _sizes.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                  onChanged: (newValue) => setState(() => _size = newValue!),
                ),
              ),

              // === Thumbnail URL ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Thumbnail URL",
                    labelText: "Thumbnail URL (opsional)",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onChanged: (value) => _thumbnail = value.trim(),
                  validator: (value) {
                    final v = (value ?? "").trim();
                    if (v.isEmpty) return null; // opsional
                    if (!_validUrl(v)) return "Masukkan URL http/https yang valid atau kosongkan.";
                    return null;
                  },

                ),
              ),

              // === Is Featured ===
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Tampilkan sebagai produk unggulan"),
                  value: _isFeatured,
                  onChanged: (v) => setState(() => _isFeatured = v ?? false),
                ),
              ),

              // === Tombol Simpan ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.pink),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Produk berhasil disimpan!'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Name: $_name'),
                                  Text('Description: $_description'),
                                  Text('Price: $_price'),
                                  Text('Stock: $_stock'),
                                  Text('Size: $_size'),
                                  Text('Color: $_color'),
                                  Text('Category: $_category'),
                                  if (_thumbnail.isNotEmpty) Text('Thumbnail: $_thumbnail'),
                                  Text('isFeatured: $_isFeatured'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: const Text("Simpan", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
