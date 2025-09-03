import 'package:e_commerce_app/core/models/products.dart';
import 'package:e_commerce_app/features/cart/provider/cart_provider.dart';
import 'package:e_commerce_app/features/product/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailScreen extends ConsumerWidget {
  final int productId;
  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productByIdProvider(productId));

    return Scaffold(
      appBar: AppBar(title: const Text("Product Details")),
      body: productAsync.when(
        data: (product) => _ProductDetailView(product: product),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Error: $e")),
      ),
    );
  }
}

class _ProductDetailView extends ConsumerWidget {
  final Product product;
  const _ProductDetailView({required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.image,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  "₹${product.price.toStringAsFixed(2)}",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: Colors.teal),
                ),
                const SizedBox(height: 16),
                Text(product.description),
                const SizedBox(height: 24),

                // ✅ Add to Cart
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () {
                      ref
                          .read(cartNotifierProvider.notifier)
                          .addToCart(
                            product.id,
                            product.title,
                            product.price.toDouble(),
                            product.image,
                          );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Added to cart")),
                      );
                    },
                    icon: const Icon(Icons.add_shopping_cart),
                    label: const Text("Add to Cart"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
