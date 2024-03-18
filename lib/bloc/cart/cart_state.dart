part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

sealed class CartActoinState extends CartState {}

final class CartInitial extends CartState {}

final class CartSuccuessState extends CartState {
  final List<ProductModel> cartItems;

  CartSuccuessState({required this.cartItems});
}

final class CartItemRemoved extends CartActoinState {}
