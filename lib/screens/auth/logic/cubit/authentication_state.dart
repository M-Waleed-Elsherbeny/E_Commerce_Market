import 'package:my_e_commerce_app/screens/auth/logic/models/user_data_model.dart';

abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class LoginLoading extends AuthenticationState {}

class LoginSuccess extends AuthenticationState {}

class LoginError extends AuthenticationState {
  final String errorMessage;
  LoginError(this.errorMessage);
}

class SignUpLoading extends AuthenticationState {}

class SignUpSuccess extends AuthenticationState {}

class SignUpError extends AuthenticationState {
  final String errorMessage;
  SignUpError(this.errorMessage);
}

final class GoogleSignInLoading extends AuthenticationState {}

final class GoogleSignInSuccess extends AuthenticationState {}

final class GoogleSignInError extends AuthenticationState {
  final String errorMessage;
  GoogleSignInError(this.errorMessage);
}

final class LogoutLoading extends AuthenticationState {}

final class LogoutSuccess extends AuthenticationState {}

final class LogoutError extends AuthenticationState {
  final String errorMessage;
  LogoutError(this.errorMessage);
}

final class ResetPasswordLoading extends AuthenticationState {}

final class ResetPasswordSuccess extends AuthenticationState {}

final class ResetPasswordError extends AuthenticationState {
  final String errorMessage;
  ResetPasswordError(this.errorMessage);
}

final class UserDataAddedLoading extends AuthenticationState {}

final class UserDataAddedSuccess extends AuthenticationState {}

final class UserDataAddedError extends AuthenticationState {
  final String errorMessage;
  UserDataAddedError(this.errorMessage);
}

final class GetUserDataLoading extends AuthenticationState {}

final class GetUserDataSuccess extends AuthenticationState {
  UserDataModel? userDataModel;
  GetUserDataSuccess({this.userDataModel});
}

final class GetUserDataError extends AuthenticationState {}
