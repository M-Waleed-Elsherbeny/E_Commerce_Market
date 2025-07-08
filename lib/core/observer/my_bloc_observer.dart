import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('Bloc: $bloc, Change: $change');
  }

  @override
  void onClose(BlocBase bloc) {
    log('Bloc: $bloc closed');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('Bloc: $bloc created');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('Bloc: $bloc, Error: $error, StackTrace: $stackTrace');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}
