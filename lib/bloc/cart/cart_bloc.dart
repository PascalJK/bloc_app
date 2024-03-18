import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/models/product.dart';
import 'package:meta/meta.dart';

import '../../data/cart_items.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<RemoveFromCartEvent>(removeFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccuessState(cartItems: cartItems));
  }

  FutureOr<void> removeFromCartEvent(RemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.product);
    emit(CartItemRemoved());
    emit(CartSuccuessState(cartItems: cartItems));
  }
}
