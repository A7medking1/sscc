import 'package:get/get.dart';
import 'package:test002/sc_media_app/core/api_constant.dart';
import 'package:test002/sc_media_app/core/controller/home_controller.dart';
import 'package:test002/sc_media_app/core/controller/layout_controller.dart';
import 'package:test002/sc_media_app/core/data/repository/posts_repo.dart';

import '../core/controller/auth_controller.dart';
import '../core/data/api_client.dart';
import '../core/data/repository/auth_repo.dart';

class AppBinding extends Bindings
{
  @override
  void dependencies()
  {
    Get.lazyPut<ApiClient>(() => ApiClient());

    Get.lazyPut<AuthRepo>(() => AuthRepo(apiClient: Get.find<ApiClient>()));
    Get.lazyPut<PostsRepo>(() => PostsRepo(apiClient: Get.find<ApiClient>()));

    Get.lazyPut<AuthController>(() => AuthController(authRepo: Get.find<AuthRepo>()));
    Get.lazyPut<AppLayoutController>(() => AppLayoutController());
    Get.lazyPut<HomeController>(() => HomeController(postsRepo: Get.find<PostsRepo>() ));

  }

}