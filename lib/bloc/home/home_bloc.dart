import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/cart_items.dart';
import 'package:bloc_app/data/wishlist_items.dart';
import 'package:meta/meta.dart';

import '../../data/grocery_data.dart';
import '../../models/product.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);
  }

  Future<FutureOr<void>> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(products: GroceryData.groceryProducts.map((e) => ProductModel.fromMap(e)).toList()));
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    var index = cartItems.indexWhere((e) => e.id == event.product.id);
    index > -1 ? cartItems.removeAt(index) : cartItems.add(event.product);
    var message = index > -1 ? 'Item removed from cart' : 'Item added to cart';
    emit(HomeProductItemAddedToCartActionState(message: message));
    emit(HomeLoadedSuccessState(products: GroceryData.groceryProducts.map((e) => ProductModel.fromMap(e)).toList()));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    var index = wishlistItems.indexWhere((e) => e.id == event.product.id);
    index > -1 ? wishlistItems.removeAt(index) : wishlistItems.add(event.product);
    var message = index > -1 ? 'Item removed from wishlist' : 'Item added to wishlist';
    emit(HomeProductItemWishlistedActionState(message: message));
    emit(HomeLoadedSuccessState(products: GroceryData.groceryProducts.map((e) => ProductModel.fromMap(e)).toList()));
  }
}
