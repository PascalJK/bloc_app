part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedSuccessState extends HomeState {
  final List<ProductModel> products;

  HomeLoadedSuccessState({required this.products});
}

final class HomeErrorState extends HomeState {}

final class HomeNavigateToWishlistPageActionState extends HomeActionState {}

final class HomeNavigateToCartPageActionState extends HomeActionState {}

final class HomeProductItemAddedToCartActionState extends HomeActionState {
  // final String message;

  // HomeProductItemAddedToCartActionState({required this.message});
}

final class HomeProductItemWishlistedActionState extends HomeActionState {}
