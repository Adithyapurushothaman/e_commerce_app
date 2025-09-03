import 'package:e_commerce_app/features/cart/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAsync = ref.watch(cartNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: cartAsync.when(
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text("Your cart is empty"));
          }
          final total = items.fold<double>(
            0,
            (sum, item) => sum + item.price * item.quantity,
          );
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ListTile(
                      leading: Image.network(item.image, width: 50, height: 50),
                      title: Text(item.title),
                      subtitle: Text("₹${item.price} x ${item.quantity}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              if (item.quantity > 1) {
                                ref
                                    .read(cartNotifierProvider.notifier)
                                    .updateQuantity(item.id, item.quantity - 1);
                              }
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              ref
                                  .read(cartNotifierProvider.notifier)
                                  .updateQuantity(item.id, item.quantity + 1);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              ref
                                  .read(cartNotifierProvider.notifier)
                                  .remove(item.id);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Total: ₹$total",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Error: $err")),
      ),
    );
  }
}
