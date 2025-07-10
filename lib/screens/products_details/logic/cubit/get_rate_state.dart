part of 'get_rate_cubit.dart';

@immutable
sealed class GetRateState {}

final class GetRateInitial extends GetRateState {}

final class GetRateLoading extends GetRateState {}
final class GetRateSuccess extends GetRateState {}
final class GetRateError extends GetRateState {}

final class AddOrUpdateRateLoading extends GetRateState {}
final class AddOrUpdateRateSuccess extends GetRateState {}
final class AddOrUpdateRateError extends GetRateState {}
