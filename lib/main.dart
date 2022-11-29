import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginbloc/common/constants/preferences.dart';
import 'package:loginbloc/common/controllers/screen_controller.dart';
import 'package:loginbloc/features/auth_firebase/bloc/auth_bloc.dart';
import 'package:loginbloc/features/auth_firebase/bloc/form_provider.dart';
import 'package:loginbloc/features/bottom_navigation_bar/cubit/navigation_cubit.dart';
import 'package:loginbloc/features/home_screen/bloc/fetch_bloc.dart';
import 'package:loginbloc/features/login_screen/bloc/auth_bloc_bloc.dart';
import 'package:loginbloc/api/repo_auth.dart';
import 'package:loginbloc/features/third_screen/cubit/theme_cubit.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  await Firebase.initializeApp();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
      ),
      BlocProvider(
        create: (_) => ThemeCubit(isDarkMode: Preferences.isDarkmode),
      ),
      BlocProvider(
        create: (context) => AuthBloc(),
      ),
      BlocProvider(
        create: (context) => AuthBlocBloc(AuthRepo()),
      ),
      BlocProvider(
        create: (context) => FetchBloc(GetData()),
      ),
      BlocProvider<NavigationCubit>(
        create: (context) => NavigationCubit(),
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark));
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'LoginBloc',
          theme: ThemeCubit.seeTheme(),
          home: const ScreenController(),
        );
      },
    );
  }
}
