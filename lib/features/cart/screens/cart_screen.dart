import 'package:e_commerce_app/core/utils/cart_utils.dart';
import 'package:e_commerce_app/core/utils/decrement_item_count.dart';
import 'package:e_commerce_app/core/utils/dialog_utils.dart';
import 'package:e_commerce_app/features/cart/provider/cart_provider.dart';
import 'package:e_commerce_app/features/cart/widget/bill_section.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAsync = ref.watch(cartNotifierProvider);

    final selectedItems = ref.watch(selectedCartItemsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).yourCartTitle)),
      body: cartAsync.when(
        data: (items) {
          if (items.isEmpty) {
            return Center(child: Text(S.of(context).YourCartIsEmptyMessage));
          }

          //calculate total of selected items
          final total = calculateSelectedTotal(items, selectedItems);

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // ✅ Checkbox
                          Checkbox(
                            value: selectedItems.contains(item.id),
                            onChanged: (checked) {
                              final notifier = ref.read(
                                selectedCartItemsProvider.notifier,
                              );
                              if (checked == true) {
                                notifier.state = {...notifier.state, item.id};
                              } else {
                                notifier.state = {...notifier.state}
                                  ..remove(item.id);
                              }
                            },
                          ),

                          // 🖼 Product image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              item.image,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),

                          // 📄 Title + Price × Qty
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "₹${item.price} x ${item.quantity}",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),

                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  handleDecrementCartItem(
                                    context,
                                    ref,
                                    itemId: item.id,
                                    currentQty: item.quantity,
                                    itemTitle: item.title,
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  ref
                                      .read(cartNotifierProvider.notifier)
                                      .updateQuantity(
                                        item.id,
                                        item.quantity + 1,
                                      );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () async {
                                  final shouldRemove =
                                      await showRemoveItemDialog(
                                        context,
                                        item.title,
                                      );

                                  if (shouldRemove) {
                                    ref
                                        .read(cartNotifierProvider.notifier)
                                        .remove(item.id);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "${item.title} removed from cart",
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              CartBillSection(total: total, selectedItems: selectedItems),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Error: $err")),
      ),
    );
  }
}
