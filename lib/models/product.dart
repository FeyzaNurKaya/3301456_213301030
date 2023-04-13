import 'package:flutter/material.dart';

class Product {
  String isim;
  String aciklama;
  String resim;
  double birimfiyat;

  Product({
    required this.isim,
    required this.aciklama,
    required this.resim,
    required this.birimfiyat,
  });
}

List<Product> products = [
  Product(
    isim: 'iPhone 11 128 Gb Akıllı Telefon Beyaz',
    aciklama:
        'Yeni çift kamera sistemi. Tüm gün süren pil ömrü1. Bir akıllı telefondaki en dayanıklı cam. Ve Apple’ın bugüne kadarki en hızlı çipi.',
    resim: 'assets/images/product1.webp',
    birimfiyat: 18.999,
  ),
  Product(
    isim: 'APPLE MJ1M2ZM/A USB-C TO USB ADAPTÖR',
    aciklama:
        'USB-C - USB Adaptörü sayesinde, iOS aygıtlarını ve standart USB aksesuarlarınızın çoğunu, USB-C bağlantı noktasına sahip yeni MacBook’a bağlayabilirsiniz.',
    resim: 'assets/images/product2.webp',
    birimfiyat: 500,
  ),
  Product(
    isim: 'APPLE MGTF3TU/A iMac M1 8C CPU 7C GPU 8 GB 256 GB SSD 24" - GÜMÜŞ',
    aciklama:
        'En iyi Apple ürünlerinden ilham aldı. M1 çipin olağanüstü gücüyle tasarlandı. Bulunduğu her ortamda ön plana çıkıyor ve hayatınıza mükemmel uyum sağlıyor.',
    resim: 'assets/images/product3.webp',
    birimfiyat: 30.999,
  ),
  Product(
    isim: 'APPLE MK2E3TU/A KABLOSUZ MAGİC MOUSE 2 - BEYAZ',
    aciklama:
        'Kablosuz ve şarj edilebilir Magic Mouse, onu masanızın üzerinde kusursuz bir şekilde hareket ettirmenizi sağlayan optimize edilmiş bir ayak tasarımına sahip. Multi-Touch yüzeyi, oldukça basit kaydırma hareketleriyle web sayfaları veya belgeler arasında gezinebilmenizi sağlıyor.',
    resim: 'assets/images/product4.webp',
    birimfiyat: 1.799,
  ),
  Product(
    isim: 'MacBook Air MGN63TU/A M1 8Gb-256Gb Ssd-Retina-13.3inc-Space Grey',
    aciklama:
        'M1 çipte Apple’ın bugüne kadar geliştirdiği en hızlı CPU bulunuyor. Bu işlemci hızı sayesinde MacBook Air profesyonel kalitede düzenleme işlemleri ve aksiyon dolu oyunlar gibi oldukça yoğun güç gerektiren görevlerin üstesinden gelebiliyor. M1 çipteki 8 çekirdekli CPU önceki nesle göre 3,5 kata kadar daha hızlı.',
    resim: 'assets/images/product5.webp',
    birimfiyat: 18.299,
  ),
  Product(
    isim:
        'MacBook Pro MPHE3TU/A M2 Pro 16Gb-512Gb Ssd-Liquid Retina-14inc-Uzay Grisi',
    aciklama:
        'Süper güçlü M2 Pro veya M2 Max çipe sahip MacBook Pro, gücünü ve verimliliğini her zamankinden de ileriye taşıyor. Tüm gün süren pil ömrü, büyüleyici Liquid Retina XDR ekran ve ihtiyacınız olan tüm bağlantı noktaları onda. Aradığınız profesyonel laptopu buldunuz.',
    resim: 'assets/images/product6.webp',
    birimfiyat: 49.999,
  ),
  Product(
    isim: 'ADDİSON RAMPAGE PULSAR M 270x320x3mm GAMİNG MOUSE PAD',
    aciklama: 'Renk	Siyah',
    resim: 'assets/images/product7.webp',
    birimfiyat: 120,
  ),
  Product(
    isim: 'ADDİSON 300521 BİLEKLİK DESTEKLİ MOUSE PAD - SİYAH',
    aciklama: 'ADDİSON 300521 BİLEKLİK DESTEKLİ MOUSE PAD',
    resim: 'assets/images/product8.jpg',
    birimfiyat: 100,
  ),
  Product(
    isim:
        'Canon Eos RP 24-105mm f/4-7.1 IS STM Aynasız Full Frame Fotoğraf Makinesi',
    aciklama:
        'Taşınabilirlik ve üstün yaratıcılık olanaklarını bir arada sunan küçük, hafif ve sezgisel tam kare aynasız fotoğraf makinesi.',
    resim: 'assets/images/product9.jpg',
    birimfiyat: 28.999,
  ),
  Product(
    isim: 'iPhone 14 Pro 256 Gb Akıllı Telefon Uzay Siyahı',
    aciklama:
        'Daha Pro. Daha ileri.Sihirli bir iPhone deneyimi. Hayat kurtarmak için tasarlanan bir güvenlik özelliği. İnovatif 48 MP Ana kamera. Ve gün ışığında 2 kata kadar daha parlak bir ekran.Yasal açıklama dipnotuna bakın Hepsi gücünü olağanüstü bir akıllı telefon çipinden alıyor.',
    resim: 'assets/images/product10.webp',
    birimfiyat: 44.599,
  ),
  Product(
    isim:
        'Canon Eos R10 RF-S 18-45 IS STM + Mount Adapter Aynasız APS-C Fotoğraf Makinesi',
    aciklama:
        'Hemen her koşulla başa çıkabilecek kadar çok yönlü bir fotoğraf makinesi. İdeal seyahat arkadaşıdır. İdeal hibrit içerik üretme aracıdır. Kendinizi yaratıcı şekilde ifade etmenizi sağlayan bir araçtır.',
    resim: 'asset/images/product11.webp',
    birimfiyat: 26.600,
  ),
];
