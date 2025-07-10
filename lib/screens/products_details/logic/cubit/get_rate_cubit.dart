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
      log('Average Rate: $averageRate');
      List<RateModel> getUserRates =
          rates
              .where(
                (userRate) =>
                    userRate.userId ==
                    userId,
              )
              .toList();
      if (getUserRates.isNotEmpty) {
        userRates = getUserRates.first.rate!;
      }
        log('User ID ==> $userId');
        log('rates.userId ==> ${getUserRates.first.userId}');
        log('User Rate ==> $userRates');
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
    averageRate = averageRate ~/ rates.length;
  }
}
