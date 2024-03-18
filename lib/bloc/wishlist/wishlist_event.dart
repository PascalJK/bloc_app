part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class RemoveFromWishlistEvent extends WishlistEvent {
  final ProductModel product;

  RemoveFromWishlistEvent({required this.product});
}
