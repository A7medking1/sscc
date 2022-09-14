import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test002/sc_media_app/views/pages/add_post_screen.dart';
import 'package:test002/sc_media_app/views/pages/profile_screen.dart';

import '../../helper/cach_helper.dart';
import '../../helper/constant.dart';
import '../../views/pages/home_screen.dart';

class AppLayoutController extends GetxController
{
  int currentIndex = 0 ;
  void changeBottomNavBar(int index)
  {
    currentIndex = index ;
    update();
  }

  final List<Widget> screens =
  [
    HomeScreen(),
    AddPostScreen(),
    ProfileScreen(),
  ];

  @override
  void onInit()async {
    userToken = await CacheHelper.getData(key: "userToken");
    super.onInit();
  }

}