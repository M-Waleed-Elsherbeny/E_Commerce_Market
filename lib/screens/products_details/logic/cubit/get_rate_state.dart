part of 'get_rate_cubit.dart';

@immutable
sealed class GetRatesAndCommentsState {}

final class GetRateInitial extends GetRatesAndCommentsState {}

final class GetRateLoading extends GetRatesAndCommentsState {}

final class GetRateSuccess extends GetRatesAndCommentsState {}

final class GetRateError extends GetRatesAndCommentsState {}

final class AddOrUpdateRateLoading extends GetRatesAndCommentsState {}

final class AddOrUpdateRateSuccess extends GetRatesAndCommentsState {}

final class AddOrUpdateRateError extends GetRatesAndCommentsState {}

final class AddCommentSuccess extends GetRatesAndCommentsState {}

final class AddCommentLoading extends GetRatesAndCommentsState {}

final class AddCommentError extends GetRatesAndCommentsState {}
