import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginbloc/common/auth/auth_error.dart';
import 'package:loginbloc/common/controllers/email_password_controller.dart';
import 'package:loginbloc/features/auth_firebase/bloc/auth_bloc.dart';
import 'package:loginbloc/features/auth_firebase/bloc/form_provider.dart';
import 'package:loginbloc/features/auth_firebase/views/reset_password_screen.dart';
import 'package:loginbloc/features/initial_screen/presentation/initial_screen.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool visiblePassword = true;
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return const InitialScreen();
        }
        if (state is AuthStateLoggedOut) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              backgroundColor: Colors.white.withOpacity(0),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 50),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, bottom: 25),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Insert your E-mail and password to login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.alternate_email,
                            color: Colors.grey.shade500,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            height: 50,
                            width: 250,
                            child: Form(
                              key: loginForm.formKey,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: TextFormField(
                                onChanged: (value) => loginForm.email = value,
                                validator: (value) {
                                  String pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                                  RegExp regExp = RegExp(pattern);
                                  return regExp.hasMatch(value ?? '')
                                      ? null
                                      : 'El valor ingresado no es un correo';
                                },
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                autofocus: true,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    focusedBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.amber)),
                                    hintText: 'E-mail ID',
                                    hintStyle:
                                        TextStyle(color: Colors.grey.shade500),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade500))),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.password,
                            color: Colors.grey.shade500,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              onFieldSubmitted: (value) {
                                context.read<AuthBloc>().add(AuthEventLogin(
                                    email: emailController.text,
                                    password: passwordController.text));
                              },
                              controller: passwordController,
                              autofocus: true,
                              obscureText: visiblePassword,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      color: visiblePassword
                                          ? Colors.grey.shade500
                                          : Colors.amber,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        visiblePassword = !visiblePassword;
                                      });
                                    },
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber),
                                  ),
                                  hintText: 'Password',
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade500),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade500))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: authErrorLogin != ''
                        ? Text(
                            textAlign: TextAlign.center,
                            authErrorLogin.split(']')[1],
                            style: const TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          )
                        : null,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          state.isLoading
                              ? const CircularProgressIndicator()
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: SizedBox(
                                    width: 250,
                                    height: 50,
                                    child: MaterialButton(
                                      onPressed: () {
                                        context.read<AuthBloc>().add(
                                            AuthEventLogin(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text));
                                      },
                                      color: Colors.amber,
                                      child: const Text('Login'),
                                    ),
                                  ),
                                ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: TextButton(
                                onPressed: () {
                                  resetPasswordScreen(context);
                                },
                                child: const Text('Forgot your password?')),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
