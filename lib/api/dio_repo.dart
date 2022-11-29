// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:loginbloc/common/models/data_model.dart';

class GetDataController extends GetxController {
  var isLoading = false.obs;
  var getDataModel = GetDataModel().obs;

  getDataFromApi() async {
    isLoading.value = true;
    try {
      var response = await Dio().get('http://api.open-notify.org/astros.json');
      getDataModel.value = GetDataModel.fromJson(response.data);
      print(response);
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }
}
