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
