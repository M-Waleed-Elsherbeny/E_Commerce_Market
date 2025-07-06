import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_e_commerce_app/core/models/products_model.dart';
import 'package:my_e_commerce_app/core/services/api_services.dart';
part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());
  final ApiServices _apiServices = ApiServices();
  List<ProductsModel> products = [];

  Future<void> getProducts() async {
    emit(GetProductsLoading());
    try {
      Response response = await _apiServices.getData("products_table?select=*,favorite_products_table(*),rates_table(*)");
      log('Response Data: ${response.data}');
      for (var item in response.data) {
        products.add(ProductsModel.fromJson(item));
      }
      log('Products Loaded: ${products.length}');
      emit(GetProductsLoaded(products));
    } catch (e) {
      emit(GetProductsError(e.toString()));
    }
  }
}
