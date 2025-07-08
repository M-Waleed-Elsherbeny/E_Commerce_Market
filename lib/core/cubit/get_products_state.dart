part of 'get_products_cubit.dart';

sealed class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoading extends GetProductsState {}

final class GetProductsSuccess extends GetProductsState {
  GetProductsSuccess();
}

final class GetProductsError extends GetProductsState {
  final String message;

  GetProductsError(this.message);
}
