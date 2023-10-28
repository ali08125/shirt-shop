import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:shirt/data/dress.dart';
import 'package:shirt/ui/widgets/product_counter.dart';

class DressScreen extends StatelessWidget {
  final DressEntity dress;
  DressScreen({super.key, required this.dress});
  ValueNotifier<int> sizeNotifier = ValueNotifier(0);
  ValueNotifier<int> colorNotifier = ValueNotifier(0);
  ValueNotifier<int> countNotifier = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                expandedHeight: MediaQuery.of(context).size.height * 0.6,
                flexibleSpace: Container(
                  margin: const EdgeInsets.all(12),
                  child: Center(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            dress.imageUrl[0],
                            fit: BoxFit.cover,
                            height: double.infinity,
                            alignment: Alignment.center,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    padding: const EdgeInsets.all(24),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(
                                      FeatherIcons.arrowLeft,
                                    )),
                                Expanded(child: Container()),
                                IconButton(
                                    padding: const EdgeInsets.all(24),
                                    onPressed: () {},
                                    icon: const Icon(
                                      FeatherIcons.heart,
                                    )),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 27, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          dress.name,
                          style: themeData.textTheme.titleMedium,
                        ),
                        Expanded(child: Container()),
                        Text(
                          '\$ ${dress.price}',
                          style: themeData.textTheme.titleMedium,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Siz sigma',
                      style: themeData.textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Colors
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Color',
                              style: themeData.textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ValueListenableBuilder(
                              valueListenable: colorNotifier,
                              builder: (BuildContext context, int value,
                                  Widget? child) {
                                return Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        colorNotifier.value = 0;
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border: value == 0
                                                ? Border.all(
                                                    color: themeData
                                                        .colorScheme.primary,
                                                    strokeAlign: BorderSide
                                                        .strokeAlignOutside,
                                                    width: 2)
                                                : null,
                                            shape: BoxShape.circle,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: InkWell(
                                        onTap: () {
                                          colorNotifier.value = 1;
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              border: value == 1
                                                  ? Border.all(
                                                      color: themeData
                                                          .colorScheme.primary,
                                                      strokeAlign: BorderSide
                                                          .strokeAlignOutside,
                                                      width: 2)
                                                  : null,
                                              shape: BoxShape.circle,
                                              color: const Color(0xff31BAD8)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        colorNotifier.value = 2;
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border: value == 2
                                                ? Border.all(
                                                    color: themeData
                                                        .colorScheme.primary,
                                                    strokeAlign: BorderSide
                                                        .strokeAlignOutside,
                                                    width: 2)
                                                : null,
                                            shape: BoxShape.circle,
                                            color: const Color(0xff9528D9)),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            )
                          ],
                        ),
                        //Sizes
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Size',
                              style: themeData.textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ValueListenableBuilder<int>(
                              valueListenable: sizeNotifier,
                              builder: (context, value, child) {
                                return Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        sizeNotifier.value = 0;
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: value == 0
                                                ? Colors.black
                                                : themeData
                                                    .colorScheme.secondary),
                                        child: Center(
                                          child: Text(
                                            'S',
                                            style: themeData
                                                .textTheme.bodyMedium!
                                                .copyWith(
                                                    color: value == 0
                                                        ? Colors.white
                                                        : Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: InkWell(
                                        onTap: () {
                                          sizeNotifier.value = 1;
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: value == 1
                                                  ? Colors.black
                                                  : themeData
                                                      .colorScheme.secondary),
                                          child: Center(
                                            child: Text(
                                              'M',
                                              style: themeData
                                                  .textTheme.bodyMedium!
                                                  .copyWith(
                                                      color: value == 1
                                                          ? Colors.white
                                                          : Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        sizeNotifier.value = 2;
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: value == 2
                                                ? Colors.black
                                                : themeData
                                                    .colorScheme.secondary),
                                        child: Center(
                                          child: Text(
                                            'L',
                                            style: themeData
                                                .textTheme.bodyMedium!
                                                .copyWith(
                                                    color: value == 2
                                                        ? Colors.white
                                                        : Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 44,
                    ),
                    Row(
                      children: [
                        ProductCounter(countNotifier: countNotifier),
                        Expanded(child: Container()),
                        ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Add to Cart',
                              style: themeData.textTheme.titleSmall!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ])),
          ],
        ),
      ),
    );
  }
}
