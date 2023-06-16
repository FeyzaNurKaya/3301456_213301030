import 'package:flutter/material.dart';
import 'package:market_application/models/models/header.dart';
import 'package:market_application/models/productDetail.dart';

// ignore: must_be_immutable
class Anasayfa extends StatelessWidget {
  Anasayfa({Key? key}) : super(key: key);

  List<Map<String, dynamic>> products = [
    {
      "isim": "iPhone 14 Pro 256 Gb Akıllı Telefon Uzay Siyahı",
      "fotoğraf": "assets/images/product10.webp",
      "aciklama":
          'Daha Pro. Daha ileri.Sihirli bir iPhone deneyimi. Hayat kurtarmak için tasarlanan bir güvenlik özelliği. İnovatif 48 MP Ana kamera. Ve gün ışığında 2 kata kadar daha parlak bir ekran.Yasal açıklama dipnotuna bakın Hepsi gücünü olağanüstü bir akıllı telefon çipinden alıyor.',
      "fiyat": "44.599 ₺"
    },
    {
      "isim": "MacBook Pro MPHE3TU/A M2 Pro-14inc-Uzay Grisi",
      "fotoğraf": "assets/images/product6.webp",
      "aciklama":
          'Süper güçlü M2 Pro veya M2 Max çipe sahip MacBook Pro, gücünü ve verimliliğini her zamankinden de ileriye taşıyor. Tüm gün süren pil ömrü, büyüleyici Liquid Retina XDR ekran ve ihtiyacınız olan tüm bağlantı noktaları onda. Aradığınız profesyonel laptopu buldunuz.',
      "fiyat": "49.999 ₺"
    },
    {
      "isim": "APPLE MJWY3TU/A MagSafe Battery Pack",
      "fotoğraf": "assets/images/product20.webp",
      "aciklama":
          'MagSafe Battery Pack’i takmak çok basit. Kullanıcı dostu kompakt tasarımı, hareket halindeyken şarj etmeyi kolaylaştırıyor. Mükemmel bir şekilde hizalanan mıknatıslar iPhone 12, iPhone 12 Pro, iPhone 13 veya iPhone 13 Pro’nuza yapışarak güvenli kablosuz şarj olanağı sağlıyor. Üstelik yapıştığı anda otomatik olarak şarj etmeye başladığından açıp kapatmanız gerekmiyor. Kredi kartlarınızın veya uzaktan kumandalı anahtarlarınızın çalışmasını da engellemiyor.',
      "fiyat": "2.569 ₺"
    },
    {
      "isim":
          "APPLE MQDP3TQ/A IPAD (10. NESİL) İÇİN MAGIC KEYBOARD FOLIO - TÜRKÇE Q KLAVYE",
      "fotoğraf": "assets/images/product15.webp",
      "aciklama":
          'Magic Keyboard Folio, iPad (10. nesil) için mükemmel bir yol arkadaşı. Olağanüstü bir yazma deneyimi sunuyor, yerleşik trackpad ile görevleri hassas bir şekilde yerine getiriyor ve 14 tuştan oluşan bir işlev tuşu sırası içeriyor. İki parçalı tasarım, çok amaçlı kullanım imkanı veriyor. Çıkarılabilir klavye ve koruyucu arka panel, iPad’e manyetik olarak yapışıyor. Ayarlanabilir stant, kusursuz ve kesintisiz görüntülemeyi mümkün kılıyor. Ve Magic Keyboard Folio, gittiğiniz her yerde iPad’inizin korunmasına yardımcı oluyor.',
      "fiyat": "5.749 ₺"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hoşgeldin",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          children: [
            header("Anasayfa"),
            const Padding(
              padding: EdgeInsets.only(top: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Yeni Gelenler",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.5,
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
          ],
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
