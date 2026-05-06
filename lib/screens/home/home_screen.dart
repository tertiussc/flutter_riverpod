import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/providers/products_provider.dart';
import 'package:flutter_riverpod_app/shared/cart_icon.dart';

// replace stateless with Consumer state so that it can access the provider state, this is only for Stateless widgets
class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Garage Sale Products'), actions: const [CartIcon()]),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blueGrey.withValues(alpha: 0.5),
              child: Column(
                children: [
                  // Make use of the provider
                  Image.asset(allProducts[index].image, width: 60, height: 60),
                  Text(allProducts[index].title),
                  Text('£${allProducts[index].price}'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
