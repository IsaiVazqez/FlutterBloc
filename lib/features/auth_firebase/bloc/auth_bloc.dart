// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:loginbloc/common/auth/auth.dart';
import 'package:loginbloc/common/auth/auth_error.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(const AuthStateLoggedOut(isLoading: false, succesful: false)) {
    on<AuthEventLogin>((event, emit) async {
      emit(const AuthStateLoggedOut(isLoading: true, succesful: false));
      try {
        await Auth().signInWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(const AuthStateLoggedIn(isLoading: false, succesful: true));
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorLogin = e.toString();
        emit(const AuthStateLoggedOut(isLoading: false, succesful: false));
      }
    });

    on<AuthEventLogOut>((event, emit) async {
      emit(const AuthStateLoggedOut(isLoading: true, succesful: false));
      try {
        await Auth().signOut();
        emit(const AuthStateLoggedOut(isLoading: false, succesful: true));
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    });
    on<AuthEventRegister>((event, emit) async {
      emit(const AuthStateLoggedOut(isLoading: true, succesful: false));
      try {
        await Auth().createUserWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(const AuthStateLoggedIn(isLoading: false, succesful: true));
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorLogin = e.toString();
        emit(const AuthStateLoggedOut(isLoading: false, succesful: false));
      }
    });
    on<AuthEventRestPassword>((event, emit) async {
      emit(const AuthStateLoggedOut(isLoading: true, succesful: false));
      try {
        await Auth().sendResetPasswordEmail(
          email: event.email,
        );
        emit(const AuthStateLoggedIn(isLoading: false, succesful: true));
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorLogin = e.toString();
        emit(const AuthStateLoggedOut(isLoading: false, succesful: false));
      }
    });
  }
}
