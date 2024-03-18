import 'dart:async';

import 'package:bloc/bloc.dart';
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
}
