import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test002/sc_media_app/helper/cach_helper.dart';
import 'package:test002/sc_media_app/views/pages/auth_screen/login_screen.dart';
import 'package:test002/sc_media_app/views/widgets/custom_button.dart';
import 'package:test002/sc_media_app/views/widgets/custom_text.dart';

import '../../../size_config.dart';
import '../../helper/constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: 'Add New Post',
            fontSize: SizeConfig.font20,
            color: Colors.grey,
          ),
          SizedBox(
            height: SizeConfig.height20,
          ),
          CustomText(
            text: 'Add New Post',
            fontSize: SizeConfig.font20,
            color: Colors.grey,
          ),
          SizedBox(
            height: SizeConfig.height40,
          ),
          CustomButton(
            text: 'Log Out',
            color: AppConstant.primaryColor,
            height: SizeConfig.height40,
            textColor: Colors.white,
            onTap: () async {
              CacheHelper.clearALlData().then((value) {
                Get.offAll(() => LoginScreen());
              });
            },
          ),
        ],
      ),
    );
  }
}
