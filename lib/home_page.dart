import 'package:flutter/material.dart';
import 'package:shop_app/cart_page.dart';
import 'package:shop_app/explore_page.dart';
import 'package:shop_app/product_list.dart';

// import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  List<Widget> pages = const [
    ProductList(),
    ExplorePage(),
    CartPage(),
  ];

  // @override
  // void initState() {
  //   super.initState();

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentPageIndex = value;
            });
          },
          currentIndex: currentPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore_rounded), label: 'Explore'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: 'Cart'),
          ]),
    );
  }
}
