import 'package:flutter/material.dart';

/// Shows a confirmation dialog when trying to remove an item from the cart.
/// Returns `true` if the user confirms, `false` otherwise.
Future<bool> showRemoveItemDialog(BuildContext context, String itemName) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Remove Item"),
      content: Text("Are you sure you want to remove $itemName from the cart?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text("No"),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text("Yes"),
        ),
      ],
    ),
  );

  return result ?? false; // default to false if dismissed
}
