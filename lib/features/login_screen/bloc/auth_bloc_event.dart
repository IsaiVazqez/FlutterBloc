part of 'auth_bloc_bloc.dart';

@immutable
abstract class AuthBlocEvent extends Equatable {}

// ignore: must_be_immutable
class LoginEvent extends AuthBlocEvent {
  String? email;

  String? password;

  LoginEvent({this.email, this.password});

  @override
  List<Object?> get props => [email, password];
}
