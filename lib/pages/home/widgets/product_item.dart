import 'package:flutter/material.dart';

import '../../../models/product.dart';

class ProductItem extends StatelessWidget {
  final ProductModel model;
  const ProductItem({super.key, required this.model});

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
                      onPressed: () {},
                      iconSize: 22,
                      icon: const Icon(Icons.favorite_outline),
                    ),
                    IconButton(
                      onPressed: () {},
                      iconSize: 22,
                      icon: const Icon(Icons.shopping_bag_outlined),
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
