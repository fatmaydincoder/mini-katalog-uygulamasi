import 'package:flutter/material.dart';
import '../models/book.dart';

class DetaySayfasi extends StatelessWidget {
  final Book book;

  const DetaySayfasi({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kitap görseli
            Image.network(
              book.imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 24),

            // Kitap başlığı
            Text(
              book.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),

            // Yazar adı
            Text(
              book.author,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            // Fiyat
            Text(
              book.price,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 24),

            // Sepete ekle butonu
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${book.title} sepete eklendi!")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
              label: const Text(
                "Sepete Ekle",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
