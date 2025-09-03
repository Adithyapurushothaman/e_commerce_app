import 'package:e_commerce_app/core/utils/dialog_utils.dart';
import 'package:e_commerce_app/features/cart/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> handleDecrementCartItem(
  BuildContext context,
  WidgetRef ref, {
  required int itemId,
  required int currentQty,
  required String itemTitle,
}) async {
  final notifier = ref.read(cartNotifierProvider.notifier);

  if (currentQty > 1) {
    notifier.updateQuantity(itemId, currentQty - 1);
  } else {
    final shouldRemove = await showRemoveItemDialog(context, itemTitle);
    if (shouldRemove) {
      notifier.remove(itemId);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("$itemTitle removed from cart")));
    }
  }
}
