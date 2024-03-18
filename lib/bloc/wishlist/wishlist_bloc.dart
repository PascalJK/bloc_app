import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/wishlist_items.dart';
import 'package:meta/meta.dart';

import '../../models/product.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<RemoveFromWishlistEvent>(removeFromWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccuessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> removeFromWishlistEvent(RemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.product);
    emit(WishlistItemRemoved());
    emit(WishlistSuccuessState(wishlistItems: wishlistItems));
  }
}
