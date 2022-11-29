import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:loginbloc/common/constants/preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({required bool isDarkMode}) : super(ThemeState(isDarkmode: false));

  static ThemeData seeTheme() {
    if (Preferences.isDarkmode = true) {
      return ThemeData.dark();
    }
    if (Preferences.isDarkmode = false) {
      return ThemeData.light();
    }
    return ThemeData.light();
  }

  void setDarkmode() {
    if (state.currentTheme == ThemeData.light()) {
      final updateState = ThemeState(isDarkmode: true);

      ThemeCubit(isDarkMode: true);
      emit(updateState);
    }
  }

  void setLightmode() {
    if (state.currentTheme == ThemeData.dark()) {
      final updateState = ThemeState(isDarkmode: false);
      ThemeCubit(isDarkMode: false);

      emit(updateState);
    }
  }
}
