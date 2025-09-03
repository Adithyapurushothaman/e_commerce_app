import 'package:e_commerce_app/domain/database/app_database.dart';

double calculateSelectedTotal(List<CartItem> items, Set<int> selectedItems) {
  return items
      .where((item) => selectedItems.contains(item.id))
      .fold<double>(0, (sum, item) => sum + item.price * item.quantity);
}
