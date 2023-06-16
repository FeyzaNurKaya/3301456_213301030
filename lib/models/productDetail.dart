import 'package:flutter/material.dart';
import 'package:market_application/models/favorite.dart';
import 'package:market_application/models/models/sepet.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    required this.resim,
    required this.isim,
    required this.aciklama,
    required this.birimfiyat,
  });

  final String resim;
  final String isim;
  final String aciklama;
  final String birimfiyat;

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Flexible(
          child: Text(
            widget.isim,
            style: TextStyle(
              color: Colors.white,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.asset(
                    widget.resim,
                    height: 500,
                    fit: BoxFit.cover,
                  ),
                  IconButton(
                    onPressed: () {
                      toggleFavorite();
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey[400],
                    ),
                    iconSize: 30,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.isim,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.aciklama,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "  ${widget.birimfiyat}  ",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        addToCart(context);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.purple),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                          Size(200, 50),
                        ),
                      ),
                      child: const Text(
                        'Sepete Ekle',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addToCart(BuildContext context) {
    String resim = widget.resim;
    String isim = widget.isim;

    Sepet.addToCart(resim, isim);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(),
      ),
    );
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        FavoritesPage.favoriteProducts.add(widget.isim);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FavoritesPage(),
          ),
        );
      } else {
        FavoritesPage.favoriteProducts.remove(widget.isim);
      }
    });
  }
}

class Sepet {
  static List<String> sepetUrunler = [];

  static void addToCart(String resim, String isim) {
    sepetUrunler.add(isim);
  }
}
