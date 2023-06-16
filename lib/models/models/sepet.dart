import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:market_application/models/product.dart';
import 'package:market_application/models/productDetail.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<int> quantities;

  @override
  void initState() {
    super.initState();
    quantities = List<int>.filled(products.length, 1);
  }

  void increaseQuantity(int index) {
    setState(() {
      quantities[index]++;
      products[index].isAddedToCart = true;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (quantities[index] > 1) {
        quantities[index]--;
      } else {
        products[index].isAddedToCart = false;
      }
    });
  }

  String formatCurrency(double amount) {
    final formatter = NumberFormat.currency(locale: 'tr_TR', symbol: '₺');
    return formatter.format(amount);
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    List<String> sepetUrunler = Sepet.sepetUrunler;
    for (int i = 0; i < sepetUrunler.length; i++) {
      String urun = sepetUrunler[i];
      Product product = products.firstWhere((product) => product.isim == urun);
      totalPrice += product.birimfiyat * quantities[i];
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    List<String> sepetUrunler = Sepet.sepetUrunler;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sepet',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.purple[200],
            ),
            child: const Center(
              child: Text('Ay sonuna kadar ÜCRETSİZ teslimat'),
            ),
          ),
          sepetUrunler.isEmpty
              ? Expanded(
                  child: Center(
                    child: Text(
                      'Sepetiniz boş',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              : Flexible(
                  child: ListView.separated(
                    itemCount: sepetUrunler.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                    itemBuilder: (context, index) {
                      String urun = sepetUrunler[index];
                      Product product = products
                          .firstWhere((product) => product.isim == urun);
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(16),
                        child: IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                product.resim,
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.width * 0.3,
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.isim,
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      product.birimfiyat.toString(),
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Miktar",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        SizedBox(width: 7),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (quantities[index] > 1) {
                                                quantities[index]--;
                                              }
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.purple[200],
                                            ),
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 7),
                                          child: Text(
                                            quantities[index].toString(),
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              quantities[index]++;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.purple[200],
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    sepetUrunler.removeAt(index);
                                    products.removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.clear),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Ödeme Tamamlandı"),
                    content: Text("Ödemeniz başarıyla tamamlandı."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Tamam",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: Column(
              children: [
                Text(
                  "Toplam Fiyat: ${formatCurrency(calculateTotalPrice())}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.purple,
                  ),
                  child: Text(
                    "Ödemeyi Tamamla",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
