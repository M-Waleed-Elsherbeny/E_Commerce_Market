import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_e_commerce_app/core/models/home_products_model.dart';
import 'package:my_e_commerce_app/core/services/api_services.dart';
part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());
  final ApiServices _apiServices = ApiServices();
  List<HomeProductsModel> products = [];
  List<HomeProductsModel> searchResult = [];
  List<HomeProductsModel> categoriesResult = [];

  Future<void> getProducts(String? query, String? category) async {
    emit(GetProductsLoading());
    try {
      Response response = await _apiServices.getData(
        "products_table?select=*,favorite_products_table(*,users(*)),sold_products(*)",
      );
      // log('Response Data: ${response.data}');
      for (var item in response.data) {
        products.add(homeProductsModelFromJson(item));
      }
      searchProduct(query ?? "");
      getProductByCategory(category ?? "");
      emit(GetProductsSuccess());
    } catch (e) {
      log('Get Products Error: $e');
      emit(GetProductsError(e.toString()));
    }
  }

  void searchProduct(String? query) {
    searchResult =
        products
            .where(
              (product) => product.productName!.toLowerCase().contains(
                query!.toLowerCase(),
              ),
            )
            .toList();
  }

  
  void getProductByCategory(String? category) {
    categoriesResult =
        products
            .where(
              (product) => product.productCategory!.trim().toLowerCase() ==
                  category!.trim().toLowerCase(),
            )
            .toList();
    log(categoriesResult.toString());
  }
}
