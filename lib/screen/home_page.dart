import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";


import "package:grocery/screen/cart.dart";
import "package:grocery/widgets/grocery_items_tile.dart";
import "package:grocery/models/data.dart";

class HomepageScreen extends ConsumerWidget {
  const HomepageScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>const  CartScreen(),
          ));
        },
        child:  const Icon(
          Icons.shopping_cart,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Good Morning,",
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Let's order fresh items for you ",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 36,
                    ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Divider(),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Fresh Items",
                style: TextStyle(fontSize: 16, color: Colors.grey[10]),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 5, left: 20, right: 20),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemCount: shopList.length,
                  itemBuilder: (context, index) {
                    final items = shopList[index];
                    return GroceryItemtile(items: items);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
