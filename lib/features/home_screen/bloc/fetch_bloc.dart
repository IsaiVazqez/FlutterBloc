import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loginbloc/api/fetch_repo.dart';
import 'package:loginbloc/common/models/user_models.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';

class FetchBloc extends Bloc<FetchEvent, FetchState> {
  FetchBloc(GetData getData) : super(FetchInitial()) {
    final RepositoryFetchData repoFetch = RepositoryFetchData();
    on<FetchEvent>((event, emit) async {
      List<User> user = await repoFetch.FetchUsers();
      // ignore: avoid_print
      print("$user");

      emit(FetchSuccess(user));
    });
  }
}
