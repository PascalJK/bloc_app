import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../bloc/cart/cart_bloc.dart';
import '../../../models/product.dart';

class CartItem extends StatelessWidget {
  final ProductModel model;
  final CartBloc cartBloc;
  const CartItem({super.key, required this.model, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade500),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(model.imageUrl), fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              model.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              model.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  model.getPriceString,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                IconButton(
                  onPressed: () => cartBloc.add(RemovedFromCartEvent()),
                  iconSize: 22,
                  icon: const Icon(CupertinoIcons.trash, color: Colors.red,),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}