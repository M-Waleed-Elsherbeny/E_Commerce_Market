part of 'get_products_cubit.dart';

sealed class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoading extends GetProductsState {}

final class GetProductsLoaded extends GetProductsState {
  final List<ProductsModel> products;

  GetProductsLoaded(this.products);
}
final class GetProductsError extends GetProductsState {
  final String message;

  GetProductsError(this.message);
}
