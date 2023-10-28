import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:shirt/ui/checkout/payment_method.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  ValueNotifier<int> paymentNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 45,
            ),
            ValueListenableBuilder(
              valueListenable: paymentNotifier,
              builder: (BuildContext context, int value, Widget? child) {
                return PaymentMethod(
                  choose: value,
                  paymentNotifier: paymentNotifier,
                );
              },
            ),
            const SizedBox(
              height: 41,
            ),
            Container(
              height: 1,
              color: Colors.black.withOpacity(0.2),
            ),
            const SizedBox(
              height: 35,
            ),
            Text('Delivery Address',
                style: themeData.textTheme.titleSmall!
                    .copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(
              height: 11,
            ),
            SizedBox(
              height: 130,
              width: double.infinity,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      height: 118,
                      width: 235,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          'Adress ${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  '+ Add a New Address',
                  style: themeData.textTheme.titleSmall!
                      .copyWith(color: themeData.colorScheme.primary),
                )),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.delivery_dining,
                  size: 45,
                  color: themeData.colorScheme.primary,
                ),
                const Expanded(child: SizedBox()),
                Text(
                  'Estimated delivery: 25 March 2024',
                  style: themeData.textTheme.titleSmall!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: 27,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Amount Payable'), Text('\$90.00')],
            )
          ],
        ),
      ),
    );
  }
}
