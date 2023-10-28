import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shirt/data/cart.dart';
import 'package:shirt/ui/cart/cart_screen.dart';
import 'package:shirt/ui/home/bloc/home_bloc.dart';
import 'package:shirt/ui/home/dress_list.dart';
import 'package:shirt/ui/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc()..add(HomeStarted()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeSuccess) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(27, 29, 27, 0),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.purple),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Hi, Selina!',
                              style: themeData.textTheme.bodyMedium,
                            ),
                            Expanded(child: Container()),
                            IconButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CartScreen(
                                      products: [
                                        CartEntity(state.dresses[index], 1, 1),
                                        CartEntity(state.dresses[index], 1, 1),
                                        CartEntity(state.dresses[index], 1, 1),
                                      ],
                                    ),
                                  ));
                                },
                                icon: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const Icon(
                                      FeatherIcons.shoppingBag,
                                      size: 32,
                                    ),
                                    Positioned(
                                      right: -8,
                                      top: -8,
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white),
                                        child: Container(
                                          margin: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: themeData
                                                  .colorScheme.primary),
                                          child: Center(
                                              child: Text(
                                            '2',
                                            style: themeData
                                                .textTheme.bodyMedium!
                                                .copyWith(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        );
                      case 1:
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 48, 0, 23),
                          child: Text(
                            'Find the best fit for all your needs!',
                            style: themeData.textTheme.titleLarge,
                          ),
                        );
                      case 2:
                        return const CustomSearchBar();
                      case 3:
                        return DressList(
                          dresses: state.dresses,
                        );
                    }
                  },
                ),
              );
            } else if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeError) {
              return Center(
                child: Text(
                  'Error!!!',
                  style: themeData.textTheme.titleLarge,
                ),
              );
            } else {
              return const Center(
                child: Text('state not supported!'),
              );
            }
          },
        ),
      ),
    );
  }
}
