import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:grocery/models/items_model.dart";
import "package:grocery/provider/cart_provider.dart";

class GroceryItemtile extends ConsumerWidget {
  const GroceryItemtile({super.key, required this.items});
  final ItemsModel items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: items.color.withAlpha(100),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              items.imagePath,
              height: 64,
            ),
            Text(items.title),
            MaterialButton(
              onPressed: () => ref.read(cartProvider.notifier).addItem(items),
              color: items.color.withAlpha(200),
              child: Text(
                "\$${items.price}",
                style:  const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
