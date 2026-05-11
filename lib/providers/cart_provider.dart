import 'package:flutter_riverpod_app/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

// Generated notifier providers

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Set<Product> build() {
    return {};
  }

  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

// New provider to calculate price
@riverpod
int cartTotal(ref) {
  final cartProducts = ref.watch(cartProvider);
  int total = 0;

  for (Product product in cartProducts) {
    total += product.price;
  }
  return total;
}
