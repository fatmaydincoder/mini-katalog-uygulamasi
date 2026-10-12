import 'package:flutter/material.dart';
import '../models/book.dart';

class SepetSayfasi extends StatefulWidget {
  final List<Book> sepet;

  const SepetSayfasi({super.key, required this.sepet});

  @override
  State<SepetSayfasi> createState() => _SepetSayfasiState();
}

class _SepetSayfasiState extends State<SepetSayfasi> {
  void sepetiBosalt() {
    setState(() {
      widget.sepet.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Sepet boşaltıldı!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    double toplam = 0;
    for (var kitap in widget.sepet) {
      String fiyatStr = kitap.price.replaceAll(RegExp(r'[^0-9]'), '');
      toplam += double.tryParse(fiyatStr) ?? 0;
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Sepetim"), backgroundColor: Colors.deepPurple),
      body: widget.sepet.isEmpty
          ? const Center(child: Text("Sepetiniz boş"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.sepet.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(widget.sepet[index].imageUrl, width: 50, fit: BoxFit.cover),
                        title: Text(widget.sepet[index].title, style: const TextStyle(color: Colors.black)),
                        subtitle: Text(widget.sepet[index].price,
                            style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        "Toplam: ₺$toplam",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: sepetiBosalt,
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        icon: const Icon(Icons.delete, color: Colors.white),
                        label: const Text("Sepeti Boşalt", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
