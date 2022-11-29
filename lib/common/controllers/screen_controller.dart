import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginbloc/common/auth/auth.dart';
import 'package:loginbloc/features/auth_firebase/bloc/auth_bloc.dart';
import 'package:loginbloc/features/auth_firebase/views/welcome_screen.dart';
import 'package:loginbloc/features/initial_screen/presentation/initial_screen.dart';

class ScreenController extends StatefulWidget {
  const ScreenController({Key? key}) : super(key: key);

  @override
  State<ScreenController> createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthStateLoggedIn || snapshot.hasData) {
              return const InitialScreen();
            }
            if (state is AuthStateLoggedOut) {
              return const WelcomeScreen();
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}
