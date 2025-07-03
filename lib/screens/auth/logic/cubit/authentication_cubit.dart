import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_e_commerce_app/core/database/database_constants.dart';
import 'package:my_e_commerce_app/core/database/supabase_config.dart';
import 'package:my_e_commerce_app/main.dart';
import 'package:my_e_commerce_app/screens/auth/logic/cubit/authentication_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
  SupabaseClient initClient = Supabase.instance.client;

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      await initClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } on AuthException catch (e) {
      log("Error in AuthException Login: $e");
      emit(LoginError(e.message));
    } catch (e) {
      log("Error in catch Login: $e");
      emit(LoginError(e.toString()));
    }
  }

  Future<void> userSignUp({
    required String email,
    required String password,
    required String username,
  }) async {
    emit(SignUpLoading());
    try {
      await initClient.auth.signUp(email: email, password: password);
      emit(SignUpSuccess());
    } on AuthException catch (e) {
      log("Error in AuthException SignUp: $e");
      emit(SignUpError(e.message));
    } catch (e) {
      log("Error in catch SignUp: $e");
      emit(SignUpError(e.toString()));
    }
  }

  GoogleSignInAccount? googleUser;
  Future<AuthResponse> signInGoogle() async {
    emit(GoogleSignInLoading());
    var webClientId = WEB_CLIENT_ID;

    final GoogleSignIn googleSignIn = GoogleSignIn(
      // clientId: iosClientId,
      serverClientId: webClientId,
    );
    googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      emit(GoogleSignInError('Google Sign-In failed'));
      return AuthResponse();
    }

    AuthResponse response = await initClient.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
    emit(GoogleSignInSuccess());
    return response;
  }

  Future<void> userLogout() async {
    emit(LogoutLoading());
    try {
      await initClient.auth.signOut();
      emit(LogoutSuccess());
    } on AuthException catch (e) {
      log("Error in AuthException Logout: $e");
      emit(LogoutError(e.message));
    } catch (e) {
      log("Error in catch Logout: $e");
      emit(LogoutError(e.toString()));
    }
  }

  Future<void> resetPassword(String email) async {
    emit(ResetPasswordLoading());
    try {
      await initClient.auth.resetPasswordForEmail(email);
      emit(ResetPasswordSuccess());
    } on AuthException catch (e) {
      log("Error in AuthException Reset Password: $e");
      emit(ResetPasswordError(e.message));
    } catch (e) {
      log("Error in catch Reset Password: $e");
      emit(ResetPasswordError(e.toString()));
    }
  }

  Future<void> addUserToDataBase(String name, String email) async {
    emit(UserDataAddedLoading());
    try {
      final uid = client.auth.currentUser?.id;
      await client.from(TABLE_NAME).insert({
        USER_ID: uid,
        NAME: name,
        EMAIL: email,
      });
      emit(UserDataAddedSuccess());
    } catch (e) {
      emit(UserDataAddedError(e.toString()));
    }
  }
}
