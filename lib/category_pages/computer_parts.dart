import 'package:flutter/material.dart';
import 'package:market_application/models/models/header.dart';
import 'package:market_application/models/productDetail.dart';

// ignore: must_be_immutable
class ComputerPartsPage extends StatelessWidget {
  String categoryTitle;

  ComputerPartsPage(this.categoryTitle, {super.key});

  List<Map> products = [
    {
      "isim": "APPLE MK2E3TU/A KABLOSUZ MAGİC MOUSE 2 - BEYAZ",
      "fotoğraf": "assets/images/product4.webp",
      "aciklama":
          'Kablosuz ve şarj edilebilir Magic Mouse, onu masanızın üzerinde kusursuz bir şekilde hareket ettirmenizi sağlayan optimize edilmiş bir ayak tasarımına sahip. Multi-Touch yüzeyi, oldukça basit kaydırma hareketleriyle web sayfaları veya belgeler arasında gezinebilmenizi sağlıyor.',
      "fiyat": "1799 \u{20BA}"
    },
    {
      "isim": "APPLE MMMQ3TU/A MAGIC MOUSE MULTİ TOUCH YÜZEY - SİYAH",
      "fotoğraf": "assets/images/product14.webp",
      "aciklama":
          'Şarj edilebilir pil, Magic Mouse’unuza iki şarj arasında yaklaşık bir ay veya daha uzun bir süre güç sağlıyor. Kutusundan çıkarır çıkarmaz kullanmaya başlayabileceğiniz Magic Mouse, Mac’inizle otomatik olarak eşleşiyor. Kutuya dahil olan örgü USB-C - Lightning Kablosu ise aygıtınızı Mac’inizdeki bir USB-C bağlantı noktasına bağlayarak eşleştirmenize ve şarj etmenize imkan sağlıyor.',
      "fiyat": "2.709 \u{20BA}"
    },
    {
      "isim":
          "APPLE MQDP3TQ/A IPAD (10. NESİL) İÇİN MAGIC KEYBOARD FOLIO - TÜRKÇE Q KLAVYE",
      "fotoğraf": "assets/images/product15.webp",
      "aciklama":
          'Magic Keyboard Folio, iPad (10. nesil) için mükemmel bir yol arkadaşı. Olağanüstü bir yazma deneyimi sunuyor, yerleşik trackpad ile görevleri hassas bir şekilde yerine getiriyor ve 14 tuştan oluşan bir işlev tuşu sırası içeriyor. İki parçalı tasarım, çok amaçlı kullanım imkanı veriyor. Çıkarılabilir klavye ve koruyucu arka panel, iPad’e manyetik olarak yapışıyor. Ayarlanabilir stant, kusursuz ve kesintisiz görüntülemeyi mümkün kılıyor. Ve Magic Keyboard Folio, gittiğiniz her yerde iPad’inizin korunmasına yardımcı oluyor.',
      "fiyat": "5749 \u{20BA}"
    },
    {
      "isim":
          "APPLE TOUCH ID VE SAYISAL TUŞ TAKIMLI MAGIC KEYBOARD TR Q KLAVYE - BEYAZ TUŞLAR",
      "fotoğraf": "assets/images/product16.webp",
      "aciklama":
          'Magic Keyboard oturum açma ve alışveriş için hızlı, kolay ve güvenli kimlik doğrulama imkanı sağlayan Touch ID özelliğiyle sunuluyor.',
      "fiyat": "4649 \u{20BA}"
    },
    {
      "isim": "APPLE MJ1M2ZM/A USB-C TO USB ADAPTÖR",
      "fotoğraf": "assets/images/product2.webp",
      "aciklama":
          'USB-C - USB Adaptörü sayesinde, iOS aygıtlarını ve standart USB aksesuarlarınızın çoğunu, USB-C bağlantı noktasına sahip yeni MacBook’a bağlayabilirsiniz.',
      "fiyat": "500 \u{20BA}"
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
