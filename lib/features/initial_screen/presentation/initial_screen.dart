import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginbloc/features/bottom_navigation_bar/cubit/navigation_cubit.dart';
import 'package:loginbloc/features/home_screen/presentation/home_screen.dart';
import 'package:loginbloc/common/constants/nav_bar_items.dart';
import 'package:loginbloc/features/second_screen/presentation/second_screen.dart';
import 'package:loginbloc/features/third_screen/views/third_screen.dart';
import 'package:loginbloc/widgets/bottom_navigation.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        if (state.navbarItem == NavbarItem.home) {
          return const Homescreen();
        } else if (state.navbarItem == NavbarItem.settings) {
          return const SecondScreen();
        } else if (state.navbarItem == NavbarItem.home2) {
          return const ThirdScreen();
        }
        return Container();
      }),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
