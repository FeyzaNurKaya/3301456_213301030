import 'package:flutter/material.dart';
import 'package:market_application/models/models/header.dart';
import 'package:market_application/models/productDetail.dart';

// ignore: must_be_immutable
class AccessoriesPage extends StatelessWidget {
  String categoryTitle;

  AccessoriesPage(this.categoryTitle, {super.key});

  List<Map<String, dynamic>> products = [
    {
      "isim": "APPLE MHJE3TU/A 20W USB-C HIZLI ŞARJ GÜÇ ADAPTÖRÜ",
      "fotoğraf": "assets/images/product19.webp",
      "aciklama":
          'Apple 20 W USB-C Güç Adaptörü, aygıtınızı evde, ofiste veya yolda hızlı ve verimli bir şekilde şarj etme imkanı sunar. Bu güç adaptörü, USB-C özellikli tüm aygıtlarla uyumludur. Ancak Apple, optimum şarj performansı için bu adaptörü iPad Pro ve iPad Air ile birlikte kullanmanızı önerir. Hızlı şarj özelliğinden yararlanmak için bu adaptörü iPhone 8 veya daha yeni model bir iPhone ile de kullanabilirsiniz. Uyumluluk: Phone Modelleri iPhone 13 Pro iPhone 13 Pro Max iPhone 13 mini iPhone 13 iPhone 12 Pro iPhone 12 Pro Max iPhone 12 mini iPhone 12 iPhone 11 Pro iPhone 11 Pro Max iPhone 11 iPhone SE (2. nesil) iPad Modelleri iPad Pro 12.9 inç (4. nesil) iPad Pro 12.9 inç (3. nesil) iPad Pro (12.9 inç) (2. nesil) iPad Pro (12.9 inç) (1. nesil) iPad Pro 11 inç (2. nesil) iPad Pro 11 inç (1. nesil) iPad Pro 10.5 inç iPad Air (4. nesil) iPad Air (3. nesil) iPad (8. nesil) iPad (7. nesil) iPad mini (5. nesil) AirPods Modelleri',
      "fiyat": "469 \u{20BA}"
    },
    {
      "isim": "APPLE MJWY3TU/A MagSafe Battery Pack",
      "fotoğraf": "assets/images/product20.webp",
      "aciklama":
          'MagSafe Battery Pack’i takmak çok basit. Kullanıcı dostu kompakt tasarımı, hareket halindeyken şarj etmeyi kolaylaştırıyor. Mükemmel bir şekilde hizalanan mıknatıslar iPhone 12, iPhone 12 Pro, iPhone 13 veya iPhone 13 Pro’nuza yapışarak güvenli kablosuz şarj olanağı sağlıyor. Üstelik yapıştığı anda otomatik olarak şarj etmeye başladığından açıp kapatmanız gerekmiyor. Kredi kartlarınızın veya uzaktan kumandalı anahtarlarınızın çalışmasını da engellemiyor.',
      "fiyat": "2569 \u{20BA}"
    },
    {
      "isim": "Apple 35W Çift USB-C Bağlantı Noktalı Güç Adaptörü",
      "fotoğraf": "assets/images/product21.webp",
      "aciklama":
          '35 W Çift USB-C Bağlantı Noktalı Güç Adaptörü evde, ofiste veya yoldayken iki aygıtı aynı anda şarj etmenize imkan tanıyor. Apple, bu adaptörü MacBook Air ile birlikte kullanmanızı öneriyor. Ayrıca onu iPhone, iPad, Apple Watch ve AirPods ile de kullanabiliyorsunuz.',
      "fiyat": "1619 \u{20BA}"
    },
    {
      "isim": "ADDİSON RAMPAGE PULSAR GAMİNG MOUSE PAD",
      "fotoğraf": "assets/images/product7.webp",
      "aciklama": 'Renk	Siyah',
      "fiyat": "120 \u{20BA}"
    },
    {
      "isim": "ADDİSON BİLEKLİK DESTEKLİ MOUSE PAD - SİYAH",
      "fotoğraf": "assets/images/product8.jpg",
      "aciklama": 'ADDİSON 300521 BİLEKLİK DESTEKLİ MOUSE PAD',
      "fiyat": "100 \u{20BA}"
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
