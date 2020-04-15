import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class LoggedOutAuthState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoggedInAuthState extends AuthState {

  final String login;

  LoggedInAuthState(this.login);

  @override
  List<Object> get props => [login];
}

class LoggingInAuthState extends AuthState {
  @override
  List<Object> get props => [];
}
