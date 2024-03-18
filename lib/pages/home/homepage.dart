import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home/home_bloc.dart';
import '../cart/cart_page.dart';
import '../wishlist/wishlist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      buildWhen: (previous, current) => current is! HomeActionState,
      listenWhen: (previous, current) => current is HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const WishlistPage()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          case HomeErrorState:
            return const Scaffold(body: Center(child: Text('Something went wrong...')));
          default:
            return Scaffold(
              appBar: AppBar(
                title: const Text('Grocery Items'),
                actions: [
                  IconButton(
                    onPressed: () => homeBloc.add(HomeWishlistButtonNavigateEvent()),
                    icon: const Icon(Icons.favorite_outline),
                  ),
                  IconButton(
                    onPressed: () => homeBloc.add(HomeCartButtonNavigateEvent()),
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),
            );
        }
      },
    );
  }
}
