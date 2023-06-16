import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  static List<String> favoriteProducts = [];

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favoriler',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: FavoritesPage.favoriteProducts.isEmpty
          ? Center(
              child: Text(
                "Favori Ürünün Yok !",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          : ListView.builder(
              itemCount: FavoritesPage.favoriteProducts.length,
              itemBuilder: (context, index) {
                final productTitle = FavoritesPage.favoriteProducts[index];
                return Container(
                  width: double.infinity,
                  height: 130.0,
                  padding: EdgeInsets.all(24.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          productTitle,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            FavoritesPage.favoriteProducts.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
