
import 'package:flutter/material.dart';

class ProductCounter extends StatelessWidget {
  final ValueNotifier<int> countNotifier;
  const ProductCounter({super.key, required this.countNotifier});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Row(children: [
      InkWell(
        onTap: () {
          countNotifier.value++;
        },
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: themeData.colorScheme.secondary),
          child: Center(
            child: Text(
              '+',
              style:
                  themeData.textTheme.bodyMedium!.copyWith(color: Colors.black),
            ),
          ),
        ),
      ),
      const SizedBox(
        width: 23,
      ),
      ValueListenableBuilder(
        builder: (BuildContext context, value, Widget? child) {
          return Text(value.toString());
        },
        valueListenable: countNotifier,
      ),
      const SizedBox(
        width: 23,
      ),
      InkWell(
        onTap: () {
          if (countNotifier.value > 1) {
            countNotifier.value--;
          }
        },
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: themeData.colorScheme.secondary),
          child: Center(
            child: Text(
              '-',
              style:
                  themeData.textTheme.bodyMedium!.copyWith(color: Colors.black),
            ),
          ),
        ),
      ),
    ]);
  }
}
