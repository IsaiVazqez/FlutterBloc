import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginbloc/features/initial_screen/presentation/initial_screen.dart';
import 'package:loginbloc/features/login_screen/bloc/auth_bloc_bloc.dart';
import 'package:loginbloc/widgets/custom_button.dart';
import 'package:loginbloc/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthBlocBloc _authBlocBloc;

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _authBlocBloc = BlocProvider.of<AuthBlocBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(vertical: 150),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 170, horizontal: 10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Center(
            child: Text('Login screen'),
          ),
          CustomTextField(
            controller: email,
            obscure: false,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            controller: password,
            obscure: true,
          ),
          const SizedBox(height: 20),
          BlocListener<AuthBlocBloc, AuthBlocState>(
              listener: (BuildContext context, state) {
                if (state is AuthBlocLoading) {
                  const Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  );
                } else if (state is AuthBlocSuccessFul) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const InitialScreen();
                  }));
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Welcome")));
                } else if (state is AuthBlocError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error: ${state.msgError}")));
                }
              },
              child: CustomButtonState(
                  onPressed: () {
                    _authBlocBloc.add(
                        LoginEvent(email: email.text, password: password.text));
                  },
                  text: "Login"))
        ]),
      ),
    ));
  }
}
