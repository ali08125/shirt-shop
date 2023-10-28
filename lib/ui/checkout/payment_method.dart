
import 'package:flutter/material.dart';
import 'package:shirt/ui/checkout/payment_item.dart';

class PaymentMethod extends StatelessWidget {
  final ValueNotifier<int> paymentNotifier;
  final int choose;
  List<bool> enables = [false, false, false, false];
  PaymentMethod(
      {super.key, required this.choose, required this.paymentNotifier}) {
    enables[choose] = true;
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment method',
          style: themeData.textTheme.titleSmall!
              .copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 8,
        ),
        PaymentItem(
          enable: enables[0],
          title: 'Gpay',
          onTap: () {
            paymentNotifier.value = 0;
          },
        ),
        PaymentItem(
          enable: enables[1],
          title: 'Debit / Credit Card',
          onTap: () {
            paymentNotifier.value = 1;
          },
        ),
        PaymentItem(
          enable: enables[2],
          title: 'Paypal',
          onTap: () {
            paymentNotifier.value = 2;
          },
        ),
        PaymentItem(
          enable: enables[3],
          title: 'Bank Transfer',
          onTap: () {
            paymentNotifier.value = 3;
          },
        ),
      ],
    );
  }
}
