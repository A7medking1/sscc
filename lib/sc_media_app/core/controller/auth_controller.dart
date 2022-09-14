import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:test002/sc_media_app/helper/cach_helper.dart';
import 'package:test002/sc_media_app/helper/constant.dart';
import 'package:test002/sc_media_app/model/register_model.dart';
import 'package:test002/sc_media_app/views/pages/auth_screen/login_screen.dart';
import 'package:test002/sc_media_app/views/pages/layout_page.dart';
import '../../model/login_model.dart';
import '../../model/posts_model.dart';
import '../../views/pages/home_screen.dart';
import '../../views/widgets/show_toast.dart';
import '../data/repository/auth_repo.dart';

class AuthController extends GetxController {
  late final AuthRepo authRepo;

  AuthController({
    required this.authRepo,
  });


  bool get isLoading => _isLoading;
  bool _isLoading = false;

  String? firstName, lastName, userName, password;

  Future userRegister(RegisterModel registerModel) async {
    _isLoading = true;
    update();
    await authRepo.userRegister(registerModel).then((value) {
      if (value.statusCode == 201) {
        showToast("register successfully", ToastStates.SUCCESS);
        Get.offAll(() => LoginScreen());
      } else {
        showToast("error", ToastStates.ERROR);
      }
      _isLoading = false;
      update();
    }).catchError((error) {
      debugPrint(error.toString());
      _isLoading = false;
      update();
    });
  }

  Future userLogin(LoginModel loginModel) async {
    _isLoading = true;
    update();
    await authRepo.userLogin(loginModel).then((response){
      if(response.statusCode == 200){
        CacheHelper.saveData(key: 'userToken', value: response.data["token"]) ;
        showToast(response.data["message"], ToastStates.SUCCESS);
        Get.offAll(()=> AppLayout());
      }else{
        showToast(response.data["message"], ToastStates.ERROR);
      }
      _isLoading = false;
      update();
    }).catchError((e){
      _isLoading = false;
      update();
      print(e.toString());
    });
  }
  //*************************************************
  bool isPasswordShow = true;
  IconData icon = Icons.visibility;

  void changeObscureText() {
    if (isPasswordShow) {
      isPasswordShow = false;
      icon = Icons.visibility_off;
    } else {
      isPasswordShow = true;
      icon = Icons.visibility;
    }
    update();
  }
}
