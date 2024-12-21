import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    // final cart = (Provider.of<CartProvider>(context).cart);

    return cart.isNotEmpty
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Manage your cart'),
              centerTitle: true,
            ),
            body: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final cartItem = cart[index];

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          cartItem['imgURL'] as String), //or .toString()
                      radius: 30,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(
                            // barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  'Remove From Cart',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                content:
                                    const Text('Did you think this through? '),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'No',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        context
                                            .read<CartProvider>()
                                            .removeProduct(cartItem);

                                        // Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Product removed successfully!')));

                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        'Yes',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              );
                            });
                      },
                      icon: const Icon(Icons.delete_rounded),
                    ),
                    title: Text(
                      cartItem['title'] as String,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    subtitle: Text(
                        'Size: ${cartItem['size'].toString()}'), //or 'as String'
                  );
                }))
        : Scaffold(
            appBar: AppBar(
              title: const Text('Cart'),
              centerTitle: true,
            ),
            body: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your cart is empty',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  Icon(
                    Icons.remove_shopping_cart_rounded,
                    size: 40,
                  )
                ],
              ),
            ),
          );
  }
}
