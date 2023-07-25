import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:grocery/provider/cart_provider.dart";

class CartScreen extends ConsumerWidget {
  const CartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                label: Text(
                  "My Cart",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 40),
                )),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final items = cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 4,
                      color: Colors.grey[50],
                      child: ListTile(
                        leading: Image.asset(
                          items.imagePath,
                          height: 36,
                        ),
                        title: Text(
                          items.title,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(),
                        ),
                        subtitle: Text(
                          "\$${items.price}",
                          style: const TextStyle(color: Colors.black),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              ref.read(cartProvider.notifier).removeItem(items);
                            },
                            icon: const Icon(
                              Icons.cancel,
                              size: 36,
                            )),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(34.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Price",
                          style: TextStyle(color: Colors.green[100]),
                        ),
                        Text(
                          "\$${ref.read(cartProvider.notifier).getTotalPrice().toStringAsFixed(2)}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.green.shade300,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: InkWell(
                        onTap: () {},
                        splashColor: Colors.green,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text("Pay Now",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            SizedBox(
                              width: 6,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 18,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
