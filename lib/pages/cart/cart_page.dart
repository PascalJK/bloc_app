import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cart/cart_bloc.dart';
import 'widgets/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {
          if (state is CartItemRemoved) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item removed')));
          }
        },
        listenWhen: (previous, current) => current is CartActoinState,
        buildWhen: (previous, current) => current is! CartActoinState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccuessState:
              final successState = state as CartSuccuessState;
              // return AnimatedList(
              //   padding: const EdgeInsets.all(10),
              //   itemBuilder: (context, index, animation) => CartItem(
              //     model: successState.cartItems[index],
              //     cartBloc: cartBloc,
              //   ),
              //   initialItemCount: successState.cartItems.length,
              // );
              return successState.cartItems.isNotEmpty
                  ? ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemBuilder: (context, index) => CartItem(
                        model: successState.cartItems[index],
                        cartBloc: cartBloc,
                      ),
                      itemCount: successState.cartItems.length,
                    )
                  : Center(child: Text('Empty Cart...', style: Theme.of(context).textTheme.bodyLarge));
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
