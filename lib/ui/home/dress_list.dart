import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shirt/data/dress.dart';
import 'package:shirt/ui/dress/dress_screen.dart';

class DressList extends StatelessWidget {
  final List<DressEntity> dresses;
  const DressList({super.key, required this.dresses});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: GridView.custom(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverWovenGridDelegate.count(
          pattern: [
            const WovenGridTile(0.48,
                alignment: AlignmentDirectional.centerStart),
            const WovenGridTile(
              0.57,
              alignment: AlignmentDirectional.center,
            ),
          ],
          crossAxisCount: 2,
          crossAxisSpacing: 17,
          mainAxisSpacing: 0,
        ),
        childrenDelegate: SliverChildBuilderDelegate(childCount: dresses.length,
            (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DressScreen(dress: dresses[index]),
              ));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: dresses[index].imageUrl.isNotEmpty
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  dresses[index].imageUrl[0],
                                  fit: BoxFit.fill,
                                ),
                              )
                            : null,
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: IconButton(
                              splashColor: Colors.white,
                              highlightColor: Colors.white,
                              onPressed: () {},
                              icon: const Icon(FeatherIcons.heart)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  dresses[index].name,
                  style: themeData.textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '\$ ${dresses[index].price}',
                  style: themeData.textTheme.titleMedium,
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
