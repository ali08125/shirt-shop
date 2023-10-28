import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                FeatherIcons.search,
                size: 28,
                color: Colors.black.withOpacity(0.2),
              ),
              suffixIcon: const Icon(
                FeatherIcons.sliders,
                size: 28,
                color: Colors.black,
              ),
              hintText: 'Search',
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14, color: Colors.black.withOpacity(0.2))),
        ));
  }
}
