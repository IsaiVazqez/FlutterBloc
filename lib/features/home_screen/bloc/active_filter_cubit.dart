import 'package:bloc/bloc.dart';

class ActiveFilterCubit extends Cubit<int> {
  ActiveFilterCubit() : super(0);

  void changeActiveFilter(int index) => emit(index);
}
