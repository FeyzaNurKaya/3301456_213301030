import 'package:flutter/material.dart';
import 'package:market_application/category_pages/allproduct.dart';
import 'package:market_application/category_pages/accessories.dart';
import 'package:market_application/category_pages/computer_parts.dart';
import 'package:market_application/category_pages/computer.dart';
import 'package:market_application/category_pages/phone.dart';
import 'package:market_application/category_pages/photo_camera.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<String> category = [
    "Tüm Ürünler",
    "Telefon",
    "Bilgisayar",
    "Bilgisayar Parçaları",
    "Aksesuarlar",
    "Foto , Kamera"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  const Text("Kategoriler",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black)),
                  const SizedBox(height: 15),
                  Column(
                    children: category
                        .map((String isim) => buildCategory(isim, context))
                        .toList(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildCategory(String title, context) {
  return GestureDetector(
    onTap: () {
      if (title == "Tüm Ürünler") {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AllProductPage(title);
        }));
      } else if (title == "Telefon") {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PhonePage(title);
        }));
      } else if (title == "Bilgisayar") {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ComputerPage(title);
        }));
      } else if (title == "Bilgisayar Parçaları") {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ComputerPartsPage(title);
        }));
      } else if (title == "Aksesuarlar") {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AccessoriesPage(title);
        }));
      } else if (title == "Foto , Kamera") {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PhotoCameraPage(title);
        }));
      }
    },
    child: Container(
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    ),
  );
}
