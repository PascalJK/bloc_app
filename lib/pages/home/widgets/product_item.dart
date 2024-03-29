import 'package:bloc_app/bloc/home/home_bloc.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';

class ProductItem extends StatelessWidget {
  final ProductModel model;
  final HomeBloc homeBloc;
  const ProductItem({super.key, required this.model, required this.homeBloc});

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () => homeBloc.add(HomeProductWishlistButtonClickedEvent(product: model)),
                      iconSize: 22,
                      icon: Icon(!model.isWishlisted ? Icons.favorite_outline : Icons.favorite),
                    ),
                    IconButton(
                      onPressed: () => homeBloc.add(HomeProductCartButtonClickedEvent(product: model)),
                      iconSize: 22,
                      icon: Icon(!model.isCarted ? Icons.shopping_bag_outlined : Icons.shopping_bag),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
