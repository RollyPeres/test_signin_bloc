import 'dart:async';

import 'package:bloc/bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.none());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(event, state);
    }
  }

  Stream<LoginState> _mapLoginSubmittedToState(
    LoginSubmitted event,
    LoginState state,
  ) async* {
    yield state.copyWith(status: LoginStatus.submissionInProgress); //state.copyWith(status: LoginStatus.submissionSuccess);
    try {
      await Future.delayed(Duration(seconds: 3));
      yield state.copyWith(status: LoginStatus.submissionSuccess);
    } on Exception catch (_) {
      yield state.copyWith(status: LoginStatus.submissionFailed);
    }
  }
}
