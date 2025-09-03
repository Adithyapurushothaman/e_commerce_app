import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/cart_provider.dart';

class CartBillSection extends ConsumerWidget {
  final double total;
  final Set<int> selectedItems;

  const CartBillSection({
    super.key,
    required this.total,
    required this.selectedItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Total: ₹${total.toStringAsFixed(2)}",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: selectedItems.isEmpty
                ? null
                : () {
                    // Place order for selected items
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Order placed successfully!"),
                      ),
                    );

                    // Optionally clear selected items
                    ref.read(selectedCartItemsProvider.notifier).state = {};
                  },
            child: const Text("Place Order"),
          ),
        ],
      ),
    );
  }
}
