import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loginbloc/common/constants/nav_bar_items.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(const NavigationState(NavbarItem.home, 0));
        break;
      case NavbarItem.settings:
        emit(const NavigationState(NavbarItem.settings, 1));
        break;
      case NavbarItem.home2:
        emit(const NavigationState(NavbarItem.home2, 2));
        break;
    }
  }
}
