import 'package:flutter/material.dart';
import 'package:market_application/models/models/header.dart';
import 'package:market_application/models/productDetail.dart';

// ignore: must_be_immutable
class PhotoCameraPage extends StatelessWidget {
  String categoryTitle;

  PhotoCameraPage(this.categoryTitle, {super.key});

  List<Map> products = [
    {
      "isim":
          "Canon Eos R10 RF-S 18-45 IS STM + Mount Adapter Aynasız APS-C Fotoğraf Makinesi",
      "fotoğraf": "assets/images/product11.webp",
      "aciklama":
          'Hemen her koşulla başa çıkabilecek kadar çok yönlü bir fotoğraf makinesi. İdeal seyahat arkadaşıdır. İdeal hibrit içerik üretme aracıdır. Kendinizi yaratıcı şekilde ifade etmenizi sağlayan bir araçtır.',
      "fiyat": "26600 \u{20BA}"
    },
    {
      "isim":
          "Canon Eos RP 24-105mm f/4-7.1 IS STM Aynasız Full Frame Fotoğraf Makinesi",
      "fotoğraf": "assets/images/product9.jpg",
      "aciklama":
          'Taşınabilirlik ve üstün yaratıcılık olanaklarını bir arada sunan küçük, hafif ve sezgisel tam kare aynasız fotoğraf makinesi.',
      "fiyat": "28999 \u{20BA}"
    },
    {
      "isim": "Canon Eos M50 Mark II 15-45mm IS STM Vlog Fotoğraf Makinesi",
      "fotoğraf": "assets/images/product12.webp",
      "aciklama":
          'Akıllı telefon kalitesinin ötesine geçerek vloglardan canlı yayınlara, selfielerden fotoğraflara kadar şimdiye kadarki en iyi içeriklerinizi yaratın.',
      "fiyat": "15799 \u{20BA}"
    },
    {
      "isim": "Canon Eos M50 Mark II IS STM Vlogger Kit Vlog Fotoğraf Makinesi",
      "fotoğraf": "assets/images/product13.webp",
      "aciklama":
          'Oluşturduğunuz içerik ne olursa olsun, kendinizi kalabalıktan ayırın ve izleyicilerinize özel içerikler sunun. EOS M50 Mark II; fotoğraf, video ve canlı yayın çekiminin yanı sıra takipçilerinizle bağlantı kurmanız için size daha fazla yol sunar.',
      "fiyat": "16499 \u{20BA}"
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
