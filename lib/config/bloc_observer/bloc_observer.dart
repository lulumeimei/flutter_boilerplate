import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log(
      'onCreate -- ${bloc.runtimeType}',
      name: 'bloc_log',
    );
    super.onCreate(bloc);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log(
      'onTransition -- ${bloc.runtimeType}',
      name: 'bloc_log',
    );
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log(
      'onChange -- ${bloc.runtimeType}',
      name: 'bloc_log',
    );
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log(
      'onError -- ${bloc.runtimeType}, $error',
      error: error,
      stackTrace: stackTrace,
      name: 'bloc_log',
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    log(
      'onClose -- ${bloc.runtimeType}',
      name: 'bloc_log',
    );
    super.onClose(bloc);
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    log(
      'onEvent -- ${event.runtimeType}',
      name: 'bloc_log',
    );
    super.onEvent(bloc, event);
  }
}
