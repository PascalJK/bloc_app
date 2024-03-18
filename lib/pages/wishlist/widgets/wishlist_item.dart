import 'package:bloc_app/bloc/wishlist/wishlist_bloc.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';

class WishlistItem extends StatelessWidget {
  final ProductModel model;
  final WishlistBloc wishlistBloc;
  const WishlistItem({super.key, required this.model, required this.wishlistBloc});

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
            height: 160,
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
                  onPressed: () => wishlistBloc.add(RemoveFromWishlistEvent(product: model)),
                  iconSize: 20,
                  icon: const Icon(Icons.favorite, color: Colors.red),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
