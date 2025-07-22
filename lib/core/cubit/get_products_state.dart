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

final class RemoveFavoriteProductLoading extends GetProductsState {}

final class RemoveFavoriteProductSuccess extends GetProductsState {}

final class RemoveFavoriteProductError extends GetProductsState {}

final class GetFavoriteProductsLoading extends GetProductsState {}
final class GetFavoriteProductsSuccess extends GetProductsState {}
final class GetFavoriteProductsError extends GetProductsState {}

final class BuyProductLoading extends GetProductsState {}
final class BuyProductSuccess extends GetProductsState {}
final class BuyProductError extends GetProductsState {}
