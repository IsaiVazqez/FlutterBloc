import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginbloc/api/repositories.dart';
import 'package:loginbloc/common/controllers/post_controller.dart';
import 'package:loginbloc/features/second_screen/presentation/widgets/list_item.dart';
import 'package:loginbloc/widgets/custom_loading.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  //DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      child: GetBuilder<PostController>(builder: (controller) {
        return LoadingOverlay(
            isLoading: controller.isLoading,
            child: ListView.builder(
              itemCount: controller.postsList.length,
              itemBuilder: (context, index) => PostsListItem(
                post: controller.postsList[index],
              ),
            ));
      }),
    ));
  }
}


/*  Obx(() => dataController.isDataLoading.value
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: dataController.user_model!.data!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Detail2Screen(
                              e: dataController.user_model!.data![index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          padding: const EdgeInsets.only(left: 20),
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(dataController
                                    .user_model!.data![index].picture!),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    dataController
                                        .user_model!.data![index].title!
                                        .toUpperCase(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ),
                                  Text(
                                      dataController
                                          .user_model!.data![index].firstName!,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 10)),
                                  Text(
                                      dataController
                                          .user_model!.data![index].lastName!,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 10)),
                                ],
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                );
              })), */