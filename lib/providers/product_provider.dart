import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_model.dart';
import '../core/network_service.dart';

final productProvider = StateNotifierProvider<ProductNotifier, List<Product>>((ref) => ProductNotifier());

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier() : super([]) {
    fetchProducts();
  }

  int _skip = 0;
  bool _hasMore = true;
  bool isLoading = false;

  Future<void> fetchProducts() async {
    if (!_hasMore || isLoading) return;

    isLoading = true;
    final newProducts = await NetworkService.fetchProducts(_skip);
    
    state = [...state, ...newProducts];
    _skip += 10;

    if (newProducts.isEmpty) _hasMore = false;
    isLoading = false;
  }
}
