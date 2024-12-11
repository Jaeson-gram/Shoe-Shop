import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sorry, we couldn\'t leave our universe',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8),
            Icon(
              Icons.explore_off,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}
