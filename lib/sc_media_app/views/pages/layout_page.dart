import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test002/sc_media_app/core/controller/layout_controller.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return  GetBuilder<AppLayoutController>(
      init: Get.put(AppLayoutController()),
      builder: (controller) => Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ],
            ),
            body: controller.screens[controller.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) => controller.changeBottomNavBar(index),
              currentIndex: controller.currentIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_to_home_screen_rounded,
                  ),
                  label: 'Add Post',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.supervised_user_circle,
                  ),
                  label: 'profile',
                ),
              ],
            ),
          ),
    );
  }
}