part of 'theme_cubit.dart';

// ignore: must_be_immutable
class ThemeState extends Equatable {
  ThemeData currentTheme;

  ThemeState({required bool isDarkmode})
      : currentTheme = isDarkmode ? ThemeData.dark() : ThemeData.light();
  @override
  List<Object> get props => [currentTheme];
}
