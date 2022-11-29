// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:get/get.dart';
import 'package:dio/dio.dart';
//import 'package:http/http.dart' as http;
import 'package:loginbloc/common/models/users_model.dart';

class DataController extends GetxController {
  // ignore: non_constant_identifier_names
  User_Model? user_model;

  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getApi();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  getApi() async {
    try {
      isDataLoading(true);
      var response = await Dio().get('http://dummyapi.io/data/v1/user',
          options: Options(headers: {'app-id': '6218809df11d1d412af5bac4'}));
      if (response.statusCode == 200) {
        ///data successfully
        var result = response.data;

        user_model = User_Model.fromJson(result);

        print(result);
      } else {
        ///error
      }
    } on DioError catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }
}
