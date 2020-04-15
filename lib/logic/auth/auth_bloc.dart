import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState => LoggedOutAuthState();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LoginEvent) {
      yield* logIn(event.login);
    } else if (event is LogoutEvent) {
      yield* logOut();
    }
  }

  Stream<AuthState> logIn(String login) async* {
    yield LoggingInAuthState();
    await Future.delayed(Duration(seconds: 2), () => true);
    yield LoggedInAuthState(login);
  }

  Stream<AuthState> logOut() async* {
    yield LoggedOutAuthState();
  }
}
