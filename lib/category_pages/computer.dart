import 'package:flutter/material.dart';
import 'package:market_application/models/models/header.dart';
import 'package:market_application/models/productDetail.dart';

// ignore: must_be_immutable
class ComputerPage extends StatelessWidget {
  String categoryTitle;

  ComputerPage(this.categoryTitle, {super.key});

  List<Map> products = [
    {
      "isim": "MacBook Pro MPHE3TU/A M2 Pro-14inc-Uzay Grisi",
      "fotoğraf": "assets/images/product6.webp",
      "aciklama":
          'Süper güçlü M2 Pro veya M2 Max çipe sahip MacBook Pro, gücünü ve verimliliğini her zamankinden de ileriye taşıyor. Tüm gün süren pil ömrü, büyüleyici Liquid Retina XDR ekran ve ihtiyacınız olan tüm bağlantı noktaları onda. Aradığınız profesyonel laptopu buldunuz.',
      "fiyat": "49999 \u{20BA}"
    },
    {
      "isim":
          "MacBook Air MGN63TU/A M1 8Gb-256Gb Ssd-Retina-13.3inc-Space Grey",
      "fotoğraf": "assets/images/product5.webp",
      "aciklama":
          'M1 çipte Apple’ın bugüne kadar geliştirdiği en hızlı CPU bulunuyor. Bu işlemci hızı sayesinde MacBook Air profesyonel kalitede düzenleme işlemleri ve aksiyon dolu oyunlar gibi oldukça yoğun güç gerektiren görevlerin üstesinden gelebiliyor. M1 çipteki 8 çekirdekli CPU önceki nesle göre 3,5 kata kadar daha hızlı.',
      "fiyat": "18299 \u{20BA}"
    },
    {
      "isim":
          "APPLE MGTF3TU/A iMac M1 8C CPU 7C GPU 8 GB 256 GB SSD 24 - GÜMÜŞ",
      "fotoğraf": "assets/images/product3.webp",
      "aciklama":
          'En iyi Apple ürünlerinden ilham aldı. M1 çipin olağanüstü gücüyle tasarlandı. Bulunduğu her ortamda ön plana çıkıyor ve hayatınıza mükemmel uyum sağlıyor.',
      "fiyat": "30999 \u{20BA}"
    },
    {
      "isim":
          "iPad Pro 4.Nesil 256GB WIFI 11''Liquid Retina Ekran iPadOS Tablet Gümüş",
      "fotoğraf": "assets/images/product22.webp",
      "aciklama":
          'M2 çip.Yeni nesil performans.Olağanüstü hız, muhteşem grafikler ve tüm gün süren pil ömrü.◊Yasal açıklama dipnotu ekleyin En zorlu işlerin üstesinden gelin, bir profesyonel gibi yaratıcılığınızı gösterin ve konsol kalitesinde oyunlar oynayın.',
      "fiyat": "24499 \u{20BA}"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              header(categoryTitle),
              const SizedBox(height: 35),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.5,
                  padding: const EdgeInsets.all(10),
                  children: products.map((product) {
                    return buildContent(
                      product["isim"],
                      product["fotoğraf"],
                      product["fiyat"],
                      product["aciklama"],
                      context,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContent(
    String productName,
    String photo,
    String price,
    String description,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              resim: photo,
              isim: productName,
              birimfiyat: price,
              aciklama: description,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              photo,
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 10),
            Text(
              productName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              price,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
