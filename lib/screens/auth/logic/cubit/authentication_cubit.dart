import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
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
}
