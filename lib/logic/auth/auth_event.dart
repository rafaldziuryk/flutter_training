import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {

  final String login;

  LoginEvent(this.login);

  @override
  List<Object> get props => [login];
}

class LogoutEvent extends AuthEvent {

  LogoutEvent();

  @override
  List<Object> get props => [];
}
