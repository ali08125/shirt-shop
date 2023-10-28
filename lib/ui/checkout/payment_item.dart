
import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  final String title;
  final bool enable;
  final Function() onTap;
  const PaymentItem({
    super.key,
    required this.title,
    required this.enable,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(width: 1)),
              child: enable
                  ? Container(
                margin: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                    color: Colors.black, shape: BoxShape.circle),
              )
                  : null,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              title,
              style: themeData.textTheme.bodyMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
