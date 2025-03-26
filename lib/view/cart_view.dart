import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/widget/cart_item.dart';
import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final products = ref.watch(productProvider);
    final totalAmount = ref.read(cartProvider.notifier).getTotal(products);

    return Scaffold(
        backgroundColor: Colors.pinkAccent.shade100,
      appBar: AppBar(title: const Text("Cart")),
      body: cart.isEmpty
          ? const Center(child: Text("Your cart is empty!"))
          : ListView(
              padding: const EdgeInsets.all(8.0),
              children: cart.keys.map((id) {
                final product = products.firstWhere((p) => p.id == id);
                return CartItem(product: product);
              }).toList(),
            ),
      bottomNavigationBar: Card(
        elevation: 8,
        margin: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total: ₹${totalAmount.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  // Add checkout logic here
                },
                child: const Text("Checkout", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
