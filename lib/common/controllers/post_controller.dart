// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:loginbloc/common/models/post_model.dart';
import 'package:loginbloc/features/second_screen/provider/post_provider.dart';

class PostController extends GetxController {
  List<Post> postsList = [];
  bool isLoading = true;
  @override
  void onInit() {
    PostsProvider().getPostsList(
      onSuccess: (posts) {
        postsList.addAll(posts);
        isLoading = false;
        update();
        print(posts.length);
      },
      onError: (error) {
        isLoading = true;
        update();
        print('error');
      },
    );
    super.onInit();
  }
}
