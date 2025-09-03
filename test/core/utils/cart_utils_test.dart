import 'package:e_commerce_app/domain/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:e_commerce_app/core/utils/cart_utils.dart';

void main() {
  group("calculateSelectedTotal", () {
    test("returns 0 when no items selected", () {
      final items = [
        CartItem(
          id: 1,
          title: "Apple",
          price: 10.0,
          image: "a.png",
          quantity: 2,
          productId: 1,
        ),
      ];
      final total = calculateSelectedTotal(items, {});
      expect(total, 0);
    });

    test("returns total of only selected items", () {
      final items = [
        CartItem(
          id: 1,
          title: "Apple",
          price: 10.0,
          image: "a.png",
          quantity: 2,
          productId: 1,
        ),
        CartItem(
          id: 2,
          title: "Banana",
          price: 5.0,
          image: "b.png",
          quantity: 3,
          productId: 1,
        ),
      ];
      final selected = {2}; // only Banana selected
      final total = calculateSelectedTotal(items, selected);
      expect(total, 15.0); // 5 * 3
    });

    test("calculates total correctly when multiple selected", () {
      final items = [
        CartItem(
          id: 1,
          title: "Apple",
          price: 10.0,
          image: "a.png",
          quantity: 2,
          productId: 1,
        ),
        CartItem(
          id: 2,
          title: "Banana",
          price: 5.0,
          image: "b.png",
          quantity: 3,
          productId: 1,
        ),
      ];
      final selected = {1, 2};
      final total = calculateSelectedTotal(items, selected);
      expect(total, 35.0); // (10*2) + (5*3)
    });
  });
}
