part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

sealed class WishlistActoinState extends WishlistState {}

final class WishlistSuccuessState extends WishlistState {
  final List<ProductModel> wishlistItems;

  WishlistSuccuessState({required this.wishlistItems});
}

final class WishlistItemRemoved extends WishlistActoinState {}
