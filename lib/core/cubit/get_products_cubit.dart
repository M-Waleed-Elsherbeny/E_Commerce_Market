import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_e_commerce_app/core/models/home_products_model.dart';
import 'package:my_e_commerce_app/core/services/api_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());
  final ApiServices _apiServices = ApiServices();
  final String userId = Supabase.instance.client.auth.currentUser!.id;
  List<HomeProductsModel> products = [];
  List<HomeProductsModel> searchResult = [];
  List<HomeProductsModel> categoriesResult = [];
  List<HomeProductsModel> favoriteProducts = [];

  Future<void> getProducts({String? query, String? category}) async {
    emit(GetProductsLoading());
    products = [];
    favoriteProducts = [];
    searchResult = [];
    categoriesResult = [];
    try {
      Response response = await _apiServices.getData(
        "products_table?select=*,favorite_products_table(*,users(*)),sold_products(*)",
      );
      // log('Response Data: ${response.data}');
      for (var item in response.data) {
        products.add(homeProductsModelFromJson(item));
      }
      log("1");
      getFavoriteProducts();
      log("favoriteProducts 1 ==> ${favoriteProducts.toString()}");
      log("2");
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
              (product) =>
                  product.productCategory!.trim().toLowerCase() ==
                  category!.trim().toLowerCase(),
            )
            .toList();
    // log(categoriesResult.toString());
  }

  Map<String, bool> hasFavoriteProducts = {};
  Future<void> addFavoriteProduct(String productId) async {
    emit(AddToFavoritesLoading());
    try {
      await _apiServices.postData("favorite_products_table", {
        "is_favorite": true,
        "user_id": userId,
        "product_id": productId,
      }, {});
      // getFavoriteProducts();
      hasFavoriteProducts.addAll({productId: true});
      await getProducts();
      log(hasFavoriteProducts.toString());
      emit(AddToFavoritesSuccess());
    } catch (e) {
      log('Add Favorite Product Error: $e');
      emit(AddToFavoritesError());
    }
  }

  bool checkIsFavorite(String productId) {
    return hasFavoriteProducts.containsKey(productId);
  }

  Future<void> deleteFavoriteProduct(String productId) async {
    emit(RemoveFavoriteProductLoading());
    try {
      await _apiServices.deleteData(
        "favorite_products_table?user_id=eq.$userId&product_id=eq.$productId",
      );
      hasFavoriteProducts.removeWhere((key, value) => key == productId);
      await getProducts();
      emit(RemoveFavoriteProductSuccess());
    } catch (e) {
      log('Delete Favorite Product Error: $e');
      emit(RemoveFavoriteProductError());
    }
  }

  void getFavoriteProducts() {
    for (HomeProductsModel product in products) {
      if (product.favoriteProductsTable!.isNotEmpty) {
        for (var favorite in product.favoriteProductsTable!) {
          if (favorite.userId == userId) {
            favoriteProducts.add(product);
            hasFavoriteProducts.addAll({product.productId!: true});
          }
        }
      }
      // log(favoriteProducts.first.productName!);
    }
  }
  Future<void> buyProduct(String productId) async {
    emit(BuyProductLoading());
    try {
      await _apiServices.postData("sold_products", {
        "user_id": userId,
        "product_id": productId,
        "is_sold": true,
      }, {});
      log("Product purchased successfully");
      emit(BuyProductSuccess());
    } catch (e) {
      log('Purchase Product Error: $e');
      emit(BuyProductError());
    }
  }
}
