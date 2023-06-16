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

  set isAddedToCart(bool isAddedToCart) {}
}

List<Product> products = [
  Product(
    isim: 'iPhone 11 128 Gb Akıllı Telefon Beyaz',
    aciklama:
        'Yeni çift kamera sistemi. Tüm gün süren pil ömrü. Bir akıllı telefondaki en dayanıklı cam. Ve Apple’ın bugüne kadarki en hızlı çipi.',
    resim: 'assets/images/product1.webp',
    birimfiyat: 18999,
  ),
  Product(
    isim: 'APPLE MJ1M2ZM/A USB-C TO USB ADAPTÖR',
    aciklama:
        'USB-C - USB Adaptörü sayesinde, iOS aygıtlarını ve standart USB aksesuarlarınızın çoğunu, USB-C bağlantı noktasına sahip yeni MacBook’a bağlayabilirsiniz.',
    resim: 'assets/images/product2.webp',
    birimfiyat: 500,
  ),
  Product(
    isim: 'APPLE MGTF3TU/A iMac M1 8C CPU 7C GPU 8 GB 256 GB SSD 24 - GÜMÜŞ',
    aciklama:
        'En iyi Apple ürünlerinden ilham aldı. M1 çipin olağanüstü gücüyle tasarlandı. Bulunduğu her ortamda ön plana çıkıyor ve hayatınıza mükemmel uyum sağlıyor.',
    resim: 'assets/images/product3.webp',
    birimfiyat: 30999,
  ),
  Product(
    isim: 'APPLE MK2E3TU/A KABLOSUZ MAGİC MOUSE 2 - BEYAZ',
    aciklama:
        'Kablosuz ve şarj edilebilir Magic Mouse, onu masanızın üzerinde kusursuz bir şekilde hareket ettirmenizi sağlayan optimize edilmiş bir ayak tasarımına sahip. Multi-Touch yüzeyi, oldukça basit kaydırma hareketleriyle web sayfaları veya belgeler arasında gezinebilmenizi sağlıyor.',
    resim: 'assets/images/product4.webp',
    birimfiyat: 1799,
  ),
  Product(
    isim: 'MacBook Air MGN63TU/A M1 8Gb-256Gb Ssd-Retina-13.3inc-Space Grey',
    aciklama:
        'M1 çipte Apple’ın bugüne kadar geliştirdiği en hızlı CPU bulunuyor. Bu işlemci hızı sayesinde MacBook Air profesyonel kalitede düzenleme işlemleri ve aksiyon dolu oyunlar gibi oldukça yoğun güç gerektiren görevlerin üstesinden gelebiliyor. M1 çipteki 8 çekirdekli CPU önceki nesle göre 3,5 kata kadar daha hızlı.',
    resim: 'assets/images/product5.webp',
    birimfiyat: 18299,
  ),
  Product(
    isim: 'MacBook Pro MPHE3TU/A M2 Pro-14inc-Uzay Grisi',
    aciklama:
        'Süper güçlü M2 Pro veya M2 Max çipe sahip MacBook Pro, gücünü ve verimliliğini her zamankinden de ileriye taşıyor. Tüm gün süren pil ömrü, büyüleyici Liquid Retina XDR ekran ve ihtiyacınız olan tüm bağlantı noktaları onda. Aradığınız profesyonel laptopu buldunuz.',
    resim: 'assets/images/product6.webp',
    birimfiyat: 49999,
  ),
  Product(
    isim: 'ADDİSON RAMPAGE PULSAR GAMİNG MOUSE PAD',
    aciklama: 'Renk	Siyah',
    resim: 'assets/images/product7.webp',
    birimfiyat: 120,
  ),
  Product(
    isim: 'ADDİSON BİLEKLİK DESTEKLİ MOUSE PAD - SİYAH',
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
    birimfiyat: 28999,
  ),
  Product(
    isim: 'iPhone 14 Pro 256 Gb Akıllı Telefon Uzay Siyahı',
    aciklama:
        'Daha Pro. Daha ileri.Sihirli bir iPhone deneyimi. Hayat kurtarmak için tasarlanan bir güvenlik özelliği. İnovatif 48 MP Ana kamera. Ve gün ışığında 2 kata kadar daha parlak bir ekran.Yasal açıklama dipnotuna bakın Hepsi gücünü olağanüstü bir akıllı telefon çipinden alıyor.',
    resim: 'assets/images/product10.webp',
    birimfiyat: 44599,
  ),
  Product(
    isim:
        'Canon Eos R10 RF-S 18-45 IS STM + Mount Adapter Aynasız APS-C Fotoğraf Makinesi',
    aciklama:
        'Hemen her koşulla başa çıkabilecek kadar çok yönlü bir fotoğraf makinesi. İdeal seyahat arkadaşıdır. İdeal hibrit içerik üretme aracıdır. Kendinizi yaratıcı şekilde ifade etmenizi sağlayan bir araçtır.',
    resim: 'assets/images/product11.webp',
    birimfiyat: 26600,
  ),
  Product(
    isim: 'Canon Eos M50 Mark II 15-45mm IS STM Vlog Fotoğraf Makinesi',
    aciklama:
        'Akıllı telefon kalitesinin ötesine geçerek vloglardan canlı yayınlara, selfielerden fotoğraflara kadar şimdiye kadarki en iyi içeriklerinizi yaratın.',
    resim: 'assets/images/product12.webp',
    birimfiyat: 15799,
  ),
  Product(
    isim:
        'Canon Eos M50 Mark II 15-45mm IS STM Vlogger Kit Vlog Fotoğraf Makinesi',
    aciklama:
        'Oluşturduğunuz içerik ne olursa olsun, kendinizi kalabalıktan ayırın ve izleyicilerinize özel içerikler sunun. EOS M50 Mark II; fotoğraf, video ve canlı yayın çekiminin yanı sıra takipçilerinizle bağlantı kurmanız için size daha fazla yol sunar.',
    resim: 'assets/images/product13.webp',
    birimfiyat: 16499,
  ),
  Product(
    isim: 'APPLE MMMQ3TU/A MAGIC MOUSE MULTİ TOUCH YÜZEY - SİYAH',
    aciklama:
        'Şarj edilebilir pil, Magic Mouse’unuza iki şarj arasında yaklaşık bir ay veya daha uzun bir süre güç sağlıyor. Kutusundan çıkarır çıkarmaz kullanmaya başlayabileceğiniz Magic Mouse, Mac’inizle otomatik olarak eşleşiyor. Kutuya dahil olan örgü USB-C - Lightning Kablosu ise aygıtınızı Mac’inizdeki bir USB-C bağlantı noktasına bağlayarak eşleştirmenize ve şarj etmenize imkan sağlıyor.',
    resim: 'assets/images/product14.webp',
    birimfiyat: 2709,
  ),
  Product(
    isim:
        'APPLE MQDP3TQ/A IPAD (10. NESİL) İÇİN MAGIC KEYBOARD FOLIO - TÜRKÇE Q KLAVYE',
    aciklama:
        'Magic Keyboard Folio, iPad (10. nesil) için mükemmel bir yol arkadaşı. Olağanüstü bir yazma deneyimi sunuyor, yerleşik trackpad ile görevleri hassas bir şekilde yerine getiriyor ve 14 tuştan oluşan bir işlev tuşu sırası içeriyor. İki parçalı tasarım, çok amaçlı kullanım imkanı veriyor. Çıkarılabilir klavye ve koruyucu arka panel, iPad’e manyetik olarak yapışıyor. Ayarlanabilir stant, kusursuz ve kesintisiz görüntülemeyi mümkün kılıyor. Ve Magic Keyboard Folio, gittiğiniz her yerde iPad’inizin korunmasına yardımcı oluyor.',
    resim: 'assets/images/product15.webp',
    birimfiyat: 5749,
  ),
  Product(
    isim:
        'APPLE TOUCH ID VE SAYISAL TUŞ TAKIMLI MAGIC KEYBOARD TR Q KLAVYE - BEYAZ TUŞLAR',
    aciklama:
        'Magic Keyboard oturum açma ve alışveriş için hızlı, kolay ve güvenli kimlik doğrulama imkanı sağlayan Touch ID özelliğiyle sunuluyor.',
    resim: 'assets/images/product16.webp',
    birimfiyat: 4649,
  ),
  Product(
    isim: 'iPhone 14 128 Gb Akıllı Telefon Yıldız Işığı',
    aciklama:
        'Karşınızda iPhone 14 ve daha büyük bir seçenek olan iPhone 14 Plus. Hayat kurtarmak için tasarlanan bir güvenlik özelliği. Her zamankinden daha uzun pil ömrü. Ve loş ışıkta daha da muhteşem fotoğraflar.Tümü, beş harika renk seçeneğiyle.',
    resim: 'assets/images/product17.webp',
    birimfiyat: 35999,
  ),
  Product(
    isim: 'iPhone 13 128 Gb Akıllı Telefon Yıldız Işığı',
    aciklama:
        'Süper parlak bir ekran ve dayanıklı tasarım. Filmleri aratmayan, kolay video çekimleri. Işık hızında bir çip. Ve hayatınızda fark yaratan çok daha uzun pil ömrü.',
    resim: 'assets/images/product18.webp',
    birimfiyat: 29999,
  ),
  Product(
    isim: 'APPLE MHJE3TU/A 20W USB-C HIZLI ŞARJ GÜÇ ADAPTÖRÜ',
    aciklama:
        'Apple 20 W USB-C Güç Adaptörü, aygıtınızı evde, ofiste veya yolda hızlı ve verimli bir şekilde şarj etme imkanı sunar. Bu güç adaptörü, USB-C özellikli tüm aygıtlarla uyumludur. Ancak Apple, optimum şarj performansı için bu adaptörü iPad Pro ve iPad Air ile birlikte kullanmanızı önerir. Hızlı şarj özelliğinden yararlanmak için bu adaptörü iPhone 8 veya daha yeni model bir iPhone ile de kullanabilirsiniz. Uyumluluk: Phone Modelleri iPhone 13 Pro iPhone 13 Pro Max iPhone 13 mini iPhone 13 iPhone 12 Pro iPhone 12 Pro Max iPhone 12 mini iPhone 12 iPhone 11 Pro iPhone 11 Pro Max iPhone 11 iPhone SE (2. nesil) iPad Modelleri iPad Pro 12.9 inç (4. nesil) iPad Pro 12.9 inç (3. nesil) iPad Pro (12.9 inç) (2. nesil) iPad Pro (12.9 inç) (1. nesil) iPad Pro 11 inç (2. nesil) iPad Pro 11 inç (1. nesil) iPad Pro 10.5 inç iPad Air (4. nesil) iPad Air (3. nesil) iPad (8. nesil) iPad (7. nesil) iPad mini (5. nesil) AirPods Modelleri',
    resim: 'assets/images/product19.webp',
    birimfiyat: 469,
  ),
  Product(
    isim: 'APPLE MJWY3TU/A MagSafe Battery Pack',
    aciklama:
        'MagSafe Battery Pack’i takmak çok basit. Kullanıcı dostu kompakt tasarımı, hareket halindeyken şarj etmeyi kolaylaştırıyor. Mükemmel bir şekilde hizalanan mıknatıslar iPhone 12, iPhone 12 Pro, iPhone 13 veya iPhone 13 Pro’nuza yapışarak güvenli kablosuz şarj olanağı sağlıyor. Üstelik yapıştığı anda otomatik olarak şarj etmeye başladığından açıp kapatmanız gerekmiyor. Kredi kartlarınızın veya uzaktan kumandalı anahtarlarınızın çalışmasını da engellemiyor.',
    resim: 'assets/images/product20.webp',
    birimfiyat: 2569,
  ),
  Product(
    isim: 'Apple 35W Çift USB-C Bağlantı Noktalı Güç Adaptörü',
    aciklama:
        '35 W Çift USB-C Bağlantı Noktalı Güç Adaptörü evde, ofiste veya yoldayken iki aygıtı aynı anda şarj etmenize imkan tanıyor. Apple, bu adaptörü MacBook Air ile birlikte kullanmanızı öneriyor. Ayrıca onu iPhone, iPad, Apple Watch ve AirPods ile de kullanabiliyorsunuz.',
    resim: 'assets/images/product21.webp',
    birimfiyat: 1619,
  ),
  Product(
    isim: 'iPad Pro 4.Nesil 256GB WIFI Liquid Retina Ekran iPadOS Tablet Gümüş',
    aciklama:
        'M2 çip.Yeni nesil performans.Olağanüstü hız, muhteşem grafikler ve tüm gün süren pil ömrü.◊Yasal açıklama dipnotu ekleyin En zorlu işlerin üstesinden gelin, bir profesyonel gibi yaratıcılığınızı gösterin ve konsol kalitesinde oyunlar oynayın.',
    resim: 'assets/images/product22.webp',
    birimfiyat: 24499,
  )
];
