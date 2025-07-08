import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_e_commerce_app/core/services/api_services.dart';
import 'package:my_e_commerce_app/screens/products_details/logic/models/rate_model.dart';

part 'get_rate_state.dart';

class GetRateCubit extends Cubit<GetRateState> {
  GetRateCubit() : super(GetRateInitial());
  final ApiServices _apiServices = ApiServices();
  List<RateModel> rates = [];

  Future<void> getRate(String productId) async {
    emit(GetRateLoading());
    try {
      final response = await _apiServices.getData(
        "rates_table?select=*&product_id=eq.$productId",
      );
      for (var rate in response.data) {
        rates.add(RateModel.fromJson(rate));
      }
      // log('Get Rate Response: ${response.data}');
      emit(GetRateSuccess());
    } catch (e) {
      log('Get Rate Error: $e');
      emit(GetRateError());
    }
  }
}
