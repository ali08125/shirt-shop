import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shirt/data/cart.dart';
import 'package:shirt/ui/checkout/checkout_screen.dart';
import 'package:shirt/ui/widgets/product_counter.dart';

class CartScreen extends StatelessWidget {
  final List<CartEntity> products;

  CartScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Bag'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return CartItem(product: products[index]);
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black.withOpacity(0.2),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
                height: 50,
                decoration: BoxDecoration(
                    color: themeData.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(15)),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: TextField(
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ElevatedButton(
                              style: const ButtonStyle(
                                  minimumSize:
                                      MaterialStatePropertyAll(Size(85, 40)),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xff42D1F0))),
                              onPressed: () {},
                              child: Text(
                                'Apply',
                                style: themeData.textTheme.bodyMedium!
                                    .copyWith(color: Colors.white),
                              )),
                        ),
                        hintText: 'Promo Code',
                        hintStyle: themeData.textTheme.bodyMedium!
                            .copyWith(color: Colors.black.withOpacity(0.2)),
                        border: InputBorder.none),
                  ),
                )),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black.withOpacity(0.2),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sub Total',
                  style: themeData.textTheme.bodySmall,
                ),
                Text(
                  '\$84.39',
                  style: themeData.textTheme.titleMedium,
                )
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shipping',
                  style: themeData.textTheme.bodySmall,
                ),
                Text(
                  '\$ 6.00',
                  style: themeData.textTheme.titleMedium,
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bag Total',
                  style: themeData.textTheme.bodySmall,
                ),
                Text(
                  '\$90.00',
                  style: themeData.textTheme.labelLarge!.copyWith(
                      fontSize: 30, color: themeData.colorScheme.primary),
                )
              ],
            ),
            const SizedBox(
              height: 29,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutScreen(),
                        ));
                  },
                  child: const Text('Proceed to Checkout')),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  String size = 'S';
  CartItem({super.key, required this.product}) {
    switch (product.size) {
      case 1:
        size = 'M';
        break;
      case 2:
        size = 'L';
        break;
    }
  }
  final CartEntity product;
  ValueNotifier<int> countNotifier = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        height: 85,
        width: double.infinity,
        // color: Colors.grey,
        child: Row(
          children: [
            SizedBox(
              height: 85,
              width: 75,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  product.dress.imageUrl[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 21,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.dress.name),
                const SizedBox(
                  height: 5,
                ),
                Text('\$ ${product.dress.price}'),
                const SizedBox(
                  height: 10,
                ),
                ProductCounter(countNotifier: countNotifier),
              ],
            ),
            Expanded(child: Container()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: Center(
                    child: Text(
                      size,
                      style: themeData.textTheme.bodyMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                  icon: Icon(
                    FeatherIcons.trash2,
                    color: themeData.colorScheme.primary,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
