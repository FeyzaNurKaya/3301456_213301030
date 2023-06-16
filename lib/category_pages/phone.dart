import 'package:flutter/material.dart';
import 'package:market_application/models/models/header.dart';
import 'package:market_application/models/productDetail.dart';

// ignore: must_be_immutable
class PhonePage extends StatelessWidget {
  String categoryTitle;

  PhonePage(this.categoryTitle, {super.key});

  List<Map> products = [
    {
      "isim": "iPhone 11 128 Gb Akıllı Telefon Beyaz",
      "fotoğraf": "assets/images/product1.webp",
      "aciklama":
          'Yeni çift kamera sistemi. Tüm gün süren pil ömrü. Bir akıllı telefondaki en dayanıklı cam. Ve Apple’ın bugüne kadarki en hızlı çipi.',
      "capacity": "128 ",
      "fiyat": "18999 \u{20BA}"
    },
    {
      "isim": "iPhone 13 128 Gb Akıllı Telefon Yıldız Işığı",
      "fotoğraf": "assets/images/product18.webp",
      "aciklama":
          'Süper parlak bir ekran ve dayanıklı tasarım. Filmleri aratmayan, kolay video çekimleri. Işık hızında bir çip. Ve hayatınızda fark yaratan çok daha uzun pil ömrü.',
      "fiyat": "29999 \u{20BA}"
    },
    {
      "isim": "iPhone 14 128 Gb Akıllı Telefon Yıldız Işığı",
      "fotoğraf": "assets/images/product17.webp",
      "aciklama":
          'Karşınızda iPhone 14 ve daha büyük bir seçenek olan iPhone 14 Plus. Hayat kurtarmak için tasarlanan bir güvenlik özelliği. Her zamankinden daha uzun pil ömrü. Ve loş ışıkta daha da muhteşem fotoğraflar.Tümü, beş harika renk seçeneğiyle.',
      "fiyat": "35999 \u{20BA}"
    },
    {
      "isim": "iPhone 14 Pro 256 Gb Akıllı Telefon Uzay Siyahı",
      "fotoğraf": "assets/images/product10.webp",
      "aciklama":
          'Daha Pro. Daha ileri.Sihirli bir iPhone deneyimi. Hayat kurtarmak için tasarlanan bir güvenlik özelliği. İnovatif 48 MP Ana kamera. Ve gün ışığında 2 kata kadar daha parlak bir ekran.Yasal açıklama dipnotuna bakın Hepsi gücünü olağanüstü bir akıllı telefon çipinden alıyor.',
      "fiyat": "44599 \u{20BA}"
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
