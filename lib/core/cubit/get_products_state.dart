part of 'get_products_cubit.dart';

sealed class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoading extends GetProductsState {}

final class GetProductsSuccess extends GetProductsState {}

final class GetProductsError extends GetProductsState {
  final String message;

  GetProductsError(this.message);
}

final class AddToFavoritesLoading extends GetProductsState {}

final class AddToFavoritesSuccess extends GetProductsState {}

final class AddToFavoritesError extends GetProductsState {}

final class RemoveFromFavoritesLoading extends GetProductsState {}

final class RemoveFromFavoritesSuccess extends GetProductsState {}

final class RemoveFromFavoritesError extends GetProductsState {}
