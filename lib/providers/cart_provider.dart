/* Cart Notifier to update state and notify listeners */
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/models/product.dart';

class CartNotifier extends Notifier<Set<Product>> {
  @override
  Set<Product> build() {
    return const {Product(id: '4', title: 'Red Backpack', price: 14, image: 'assets/products/backpack.png')};
  }

  // methods to update state
  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((element) => element.id != product.id).toSet();
    }
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});
