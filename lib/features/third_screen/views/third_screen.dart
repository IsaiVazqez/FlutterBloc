import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loginbloc/api/dio_repo.dart';
import 'package:loginbloc/common/constants/preferences.dart';
import 'package:loginbloc/features/third_screen/cubit/theme_cubit.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final getDataController = Get.put(GetDataController());

  @override
  void initState() {
    getDataController.getDataFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Switch.adaptive(
        value: Preferences.isDarkmode,
        onChanged: (value) {
          Preferences.isDarkmode = value;

          final cubit = context.read<ThemeCubit>();

          value ? cubit.setDarkmode() : cubit.setLightmode();
          setState(() {});
        },
      ),
    );
  }
}


/*     return Obx(
      () => Scaffold(
        body: !getDataController.isLoading.value
            ? ListView.builder(
                itemCount: getDataController.getDataModel.value.people!.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getDataController
                                  .getDataModel.value.people![index].craft ??
                              'hola',
                        ),
                        Text(
                          getDataController
                                  .getDataModel.value.people![index].name ??
                              'hola',
                        ),
                      ],
                    ),
                  ));
                })
            : const Center(child: CircularProgressIndicator()),
      ),
    ); */