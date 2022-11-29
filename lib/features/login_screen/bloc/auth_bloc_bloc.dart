import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:loginbloc/api/repo_auth.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final AuthRepo _authRepo;
  AuthBlocBloc(this._authRepo) : super(AuthBlocLoading()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthBlocLoading());
      final result = await _authRepo.login(event.email, event.password);
      if (result == "user not found" ||
          result == "Missing password" ||
          result == "Missing email or username") {
        emit(AuthBlocError(result));
      } else {
        {
          emit(AuthBlocSuccessFul());
        }
      }
    });
  }
}
