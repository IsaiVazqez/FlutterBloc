part of 'auth_bloc_bloc.dart';

@immutable
abstract class AuthBlocState extends Equatable {}

class AuthBlocInitial extends AuthBlocState {
  @override
  List<Object?> get props => [];
}

class AuthBlocSuccessFul extends AuthBlocState {
  @override
  List<Object?> get props => [];
}

class AuthBlocLoading extends AuthBlocState {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class AuthBlocError extends AuthBlocState {
  String? msgError;
  AuthBlocError(this.msgError);
  @override
  List<Object?> get props => [msgError];
}
