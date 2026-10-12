import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/book_card.dart';
import 'detay_sayfasi.dart';
import 'sepet_sayfasi.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final List<Book> kitaplar = [
    Book(
      title: "Simyacı",
      author: "Paulo Coelho",
      price: "₺90",
      imageUrl: "https://images-na.ssl-images-amazon.com/images/I/71aFt4+OTOL.jpg",
    ),
    Book(
      title: "Harry Potter ve Felsefe Taşı",
      author: "J.K. Rowling",
      price: "₺120",
      imageUrl: "https://images-na.ssl-images-amazon.com/images/I/81YOuOGFCJL.jpg",
    ),
    Book(
      title: "Kürk Mantolu Madonna",
      author: "Sabahattin Ali",
      price: "₺75",
      // Senin verdiğin yüksek çözünürlüklü kapak görseli
      imageUrl: "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1362477552i/220826.jpg",
    ),
    Book(
      title: "1984",
      author: "George Orwell",
      price: "₺100",
      imageUrl: "https://images-na.ssl-images-amazon.com/images/I/71kxa1-0mfL.jpg",
    ),
  ];

  final List<Book> sepet = [];

  void kitapSepeteEkle(Book kitap) {
    setState(() {
      sepet.add(kitap);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${kitap.title} sepete eklendi!")),
    );
  }

  void sepeteGit() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SepetSayfasi(sepet: sepet)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mini Katalog Uygulaması"),
        backgroundColor: Colors.deepPurple,
        actions: [
          TextButton.icon(
            onPressed: sepeteGit,
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            label: Text(
              "Sepet (${sepet.length})",
              style: const TextStyle(color: Colors.white),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.65,
        ),
        itemCount: kitaplar.length,
        itemBuilder: (context, index) {
          final kitap = kitaplar[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetaySayfasi(book: kitap)),
              );
            },
            child: BookCard(book: kitap, onAdd: kitapSepeteEkle),
          );
        },
      ),
    );
  }
}
