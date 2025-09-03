import 'package:e_commerce_app/features/cart/provider/cart_provider.dart';
import 'package:e_commerce_app/features/home/widget/item_added_to_cart_dialog.dart';
import 'package:e_commerce_app/features/product/provider/product_provider.dart';
import 'package:e_commerce_app/features/product/widgets/product_item.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomeScreen> {
  final cartKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final productList = ref.watch(productListNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appTitle),
        actions: [
          IconButton(
            key: cartKey,
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () => context.push('/cart'),
          ),
        ],
      ),
      body: productList.when(
        data: (products) => RefreshIndicator(
          onRefresh: () =>
              ref.read(productListNotifierProvider.notifier).refresh(),
          child: GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductItem(
                product: product,
                onTap: () {
                  context.push('/product/${product.id}');
                },
                trailing: Builder(
                  builder: (btnContext) {
                    final addBtnKey = GlobalKey();

                    return FilledButton(
                      key: addBtnKey,
                      onPressed: () async {
                        ref
                            .read(cartNotifierProvider.notifier)
                            .addToCart(
                              product.id,
                              product.title,
                              product.price.toDouble(),
                              product.image,
                            );
                        await showItemAddedDialog(context, product.title);
                      },
                      child: Text(S.of(context).buttonAddToCart),
                    );
                  },
                ),
              );
            },
          ),
        ),
        loading: () =>
            const Center(child: CircularProgressIndicator.adaptive()),
        error: (err, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Error: $err"),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () =>
                    ref.read(productListNotifierProvider.notifier).refresh(),
                child: const Text("Retry"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
