import 'package:bloc_app/pages/wishlist/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/wishlist/wishlist_bloc.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {
          if (state is WishlistItemRemoved) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item removed')));
          }
        },
        listenWhen: (previous, current) => current is WishlistActoinState,
        buildWhen: (previous, current) => current is! WishlistActoinState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccuessState:
              final successState = state as WishlistSuccuessState;
              return successState.wishlistItems.isNotEmpty
                  ? ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemBuilder: (context, index) => WishlistItem(
                        model: successState.wishlistItems[index],
                        wishlistBloc: wishlistBloc,
                      ),
                      itemCount: successState.wishlistItems.length,
                    )
                  : Center(child: Text('Empty List...', style: Theme.of(context).textTheme.bodyLarge));
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
