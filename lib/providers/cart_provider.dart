import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_model.dart';

final cartProvider = StateNotifierProvider<CartNotifier, Map<int, int>>((ref) => CartNotifier());

class CartNotifier extends StateNotifier<Map<int, int>> {
  CartNotifier() : super({});

  void addToCart(Product product) {
    state = {...state, product.id: (state[product.id] ?? 0) + 1};
  }

  void removeFromCart(int productId) {
    if (state.containsKey(productId)) {
      final newState = Map<int, int>.from(state);
      newState[productId] = newState[productId]! - 1;
      if (newState[productId] == 0) {
        newState.remove(productId);
      }
      state = newState;
    }
  }

  double getTotal(List<Product> products) {
    return state.entries.fold(0.0, (sum, entry) {
      final product = products.firstWhere((p) => p.id == entry.key);
      return sum + (product.discountedPrice * entry.value);
    });
  }
}
