import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:grocery/provider/cart_provider.dart";

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({
    super.key,
  });
@override
  ConsumerState<ConsumerStatefulWidget> createState() {
   return _CartScreenState();
  }
}

class _CartScreenState extends ConsumerState{
  @override
  Widget build(BuildContext context) {
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
                  final updatePrice = ref.watch(cartProvider.notifier).updatePrice(items); 
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      elevation: 4,
                      color: Colors.grey[50],
                      child: ListTile(
                          leading: Image.asset(
                            items.imagePath,
                            height: 30,
                          ),
                          title: Text(
                            items.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 13),
                          ),
                          subtitle: Text(
                            "\$$updatePrice",
                            style: const TextStyle(color: Colors.black),
                          ),
                          trailing: SizedBox(
                            width: 152,
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black)
                            // ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                              items.quantity>1 ?  ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      ref
                                        .read(cartProvider.notifier)
                                        .decreaseQuantity(items);
                                    });
                                    
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          left: 10,
                                          right: 10),
                                      minimumSize: const Size(15, 15),
                                      foregroundColor: Colors.black),
                                  child: const Icon(
                                    Icons.remove,
                                    size: 10,
                                  ),
                                ) : ElevatedButton(
                                  onPressed: () {
                                    ref
                                        .read(cartProvider.notifier)
                                        .removeItem(items);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5, left: 10, right: 10),
                                    minimumSize: const Size(15, 15),
                                  ),
                                  child: const  Icon(
                                    Icons.delete,
                                    size: 15,
                                    color: Color.fromARGB(241, 153, 4, 4),
                                  ),
                                )
                                
                                
                                ,
                                Text(items.quantity.toString()),
                                ElevatedButton(
                                  onPressed: () {

                                    setState(() {
                                          ref
                                        .read(cartProvider.notifier)
                                        .increaseQuantity(items);
                                    });
                                
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          left: 10,
                                          right: 10),
                                      minimumSize: const Size(10, 10),
                                      foregroundColor: Colors.black),
                                  child: const Icon(
                                    Icons.add,
                                    size: 10,
                                  ),
                                ),
                                
                              ],
                            ),
                          )),
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
            // IconButton(
            //                 onPressed: () {
            //                   ref.read(cartProvider.notifier).removeItem(items);
            //                 },
            //                 icon: const Icon(
            //                   Icons.cancel,
            //                   size: 36,
            //                 )),
          ],
        ),
      ),
    );
  }
}
