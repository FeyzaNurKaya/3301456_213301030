import 'package:flutter/material.dart';
import 'package:market_application/models/categories.dart';
import 'package:market_application/models/favorite.dart';
import 'package:market_application/models/models/account.dart';
import 'package:market_application/models/models/anasayfa.dart';
import 'package:market_application/models/models/sepet.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<String> favoriteProducts = [];
  List<String> sepetUrunler = [];

  static final List<Widget> _widgetOptions = <Widget>[
    Anasayfa(),
    CategoryPage(),
    FavoritesPage(),
    CartPage(),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Kategoriler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorilerim',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Sepetim',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Hesabım',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }
}
