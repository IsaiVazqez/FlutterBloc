import 'package:loginbloc/api/api_base.dart';
import 'package:loginbloc/common/constants/constant.dart';
import 'package:loginbloc/common/models/user_models.dart';

class RepositoryFetchData {
  final ApiBase _apiBase = ApiBase();

  // ignore: non_constant_identifier_names
  Future<List<User>> FetchUsers() async {
    final response = await _apiBase.getData(key);

    List<User> user =
        (response as List).map((data) => User.fromJson(data)).toList();

    return user;
  }
}
