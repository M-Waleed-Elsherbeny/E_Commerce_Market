import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_e_commerce_app/core/services/api_services.dart';
import 'package:my_e_commerce_app/screens/products_details/logic/models/rate_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'get_rate_state.dart';

class GetRateCubit extends Cubit<GetRateState> {
  GetRateCubit() : super(GetRateInitial());
  final ApiServices _apiServices = ApiServices();
  List<RateModel> rates = [];
  int averageRate = 0;
  int userRates = 0;
  String userId = Supabase.instance.client.auth.currentUser!.id;

  Future<void> getRate(String productId) async {
    emit(GetRateLoading());
    try {
      final response = await _apiServices.getData(
        "rates_table?select=*&product_id=eq.$productId",
      );
      for (var rate in response.data) {
        rates.add(RateModel.fromJson(rate));
      }
      _getAverageRate();
      List<RateModel> getUserRates =
          rates.where((userRate) => userRate.userId == userId).toList();
      if (getUserRates.isNotEmpty) {
        userRates = getUserRates.first.rate!;
      }
      emit(GetRateSuccess());
    } catch (e) {
      log('Get Rate Error: $e');
      emit(GetRateError());
    }
  }

  void _getAverageRate() {
    for (var userRate in rates) {
      if (userRate.rate != null) {
        averageRate += userRate.rate as int;
      }
    }
    if (rates.isNotEmpty) {
      averageRate = averageRate ~/ rates.length;
    }
  }

  bool _isUserRated({required String productId}) {
    for (var userRate in rates) {
      if ((userRate.userId == userId) && (userRate.productId == productId)) {
        return true;
      }
    }
    return false;
  }

  Future<void> addOrUpdateRate({
    required String productId,
    required int rate,
  }) async {
    try {
      emit(AddOrUpdateRateLoading());
      Map<String, dynamic> data = {"rate": rate};
      Map<String, dynamic> queryParameters = {
        "user_id": "eq.$userId",
        "product_id": "eq.$productId",
      };
      if (_isUserRated(productId: productId)) {
        await _apiServices.putData("rates_table", data, queryParameters);
      } else {
        Map<String, dynamic> postData = {
          "user_id": userId,
          "product_id": productId,
          "rate": rate,
        };
        await _apiServices.postData("rates_table", postData, queryParameters);
      }
      emit(AddOrUpdateRateSuccess());
    } catch (e) {
      log('Add Rate Error: $e');
      emit(AddOrUpdateRateError());
    }
  }
}
