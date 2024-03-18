part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeProductCartButtonClickedEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}
