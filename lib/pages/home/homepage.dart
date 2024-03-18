import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home/home_bloc.dart';
import '../cart/cart_page.dart';
import '../wishlist/wishlist_page.dart';
import 'widgets/product_item.dart';

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
        } else if (state is HomeProductItemAddedToCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item added to wishlist')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          case HomeErrorState:
            return const Scaffold(body: Center(child: Text('Something went wrong...')));
          case HomeLoadedSuccessState:
            final sState = state as HomeLoadedSuccessState;
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
              body: ListView.builder(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                itemBuilder: (context, index) => ProductItem(model: sState.products[index], homeBloc: homeBloc),
                itemCount: sState.products.length,
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
