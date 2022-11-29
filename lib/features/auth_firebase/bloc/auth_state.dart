part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final bool isLoading;
  final bool succesful;

  const AuthState({required this.isLoading, required this.succesful});
}

class AuthStateLoggedIn extends AuthState {
  const AuthStateLoggedIn({
    required isLoading,
    required succesful,
  }) : super(isLoading: isLoading, succesful: succesful);

  @override
  List<Object?> get props => [isLoading, succesful];
}

class AuthStateLoggedOut extends AuthState {
  const AuthStateLoggedOut({
    required isLoading,
    required succesful,
  }) : super(isLoading: isLoading, succesful: succesful);

  @override
  List<Object?> get props => [isLoading, succesful];
}
