part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

@immutable
class AuthEventLogOut extends AuthEvent {
  const AuthEventLogOut();

  @override
  List<Object?> get props => throw UnimplementedError();
}

@immutable
class AuthEventLogin extends AuthEvent {
  final String email;
  final String password;
  const AuthEventLogin({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

@immutable
class AuthEventRegister extends AuthEvent {
  final String email;
  final String password;
  const AuthEventRegister({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

@immutable
class AuthEventRestPassword extends AuthEvent {
  final String email;

  const AuthEventRestPassword({required this.email});

  @override
  List<Object?> get props => [email];
}
