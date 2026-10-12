import 'package:flutter/material.dart';
import '../models/book.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final Function(Book) onAdd;

  const BookCard({super.key, required this.book, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                book.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(book.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                const SizedBox(height: 4),
                Text(book.author, style: const TextStyle(color: Colors.black87)),
                const SizedBox(height: 4),
                Text(book.price,
                    style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () => onAdd(book),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                  icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
                  label: const Text("Sepete Ekle", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
