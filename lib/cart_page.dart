import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage your cart'),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Not sure we took your order',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8),
            Icon(
              Icons.shopping_bag_outlined,
              size: 40,
            ),
          ],
        ),
      ),
    );
  }
}
