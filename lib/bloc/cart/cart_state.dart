part of 'cart_bloc.dart';

@immutable
sealed class CartState {}
sealed class CartActoinState extends CartState {}

final class CartInitial extends CartState {}
final class CartSuccuessState extends CartState {}
final class CartErrorState extends CartState {}
final class CartLoadingState extends CartState {}
