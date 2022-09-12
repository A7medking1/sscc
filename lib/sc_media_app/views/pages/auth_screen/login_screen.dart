import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test002/sc_media_app/views/pages/auth_screen/sign_up_screen.dart';
import 'package:test002/sc_media_app/views/widgets/show_toast.dart';
import '../../../../size_config.dart';
import '../../../core/controller/auth_controller.dart';
import '../../../helper/constant.dart';
import '../../../model/login_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsetsDirectional.all(SizeConfig.height40),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: GetBuilder<AuthController>(
              init: Get.find<AuthController>(),
              builder: (authController) {
                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomText(
                        text: 'Login',
                        fontSize: SizeConfig.font20,
                      ),
                      SizedBox(
                        height: SizeConfig.iconSize15,
                      ),
                      CustomText(
                        text: 'Add your details to login',
                        fontSize: SizeConfig.font15,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: SizeConfig.height40,
                      ),
                      CustomTextFormField(
                        title: 'Email',
                        hint: 'Your Email',
                        onSave: (value) {
                          authController.userName = value;
                        },
                        validator: (value) => _validate(value),
                      ),
                      SizedBox(
                        height: SizeConfig.height40,
                      ),
                      CustomTextFormField(
                        title: 'Password',
                        hint: 'Your Password',
                        validator: (value) => _validate(value),
                        suffixIcon: authController.icon,
                        obscureText: authController.isPasswordShow,
                        suffixIconOnPressed: () => authController.changeObscureText(),
                        onSave: (value) {
                          authController.password = value;
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.height30,
                      ),
                     !authController.isLoading
                          ? CustomButton(
                              text: 'Login',
                              color: AppConstant.primaryColor,
                              height: SizeConfig.height40,
                              textColor: Colors.white,
                              onTap: () async {
                                _formKey.currentState!.save();
                                if (_formKey.currentState!.validate()) {
                                  LoginModel loginModel = LoginModel(
                                    password: authController.password,
                                    username: authController.userName,
                                  );
                                  await authController.userLogin(loginModel);
                                }
                              },
                            )
                          : const Center(child: CircularProgressIndicator()),
                      SizedBox(
                        height: SizeConfig.height20,
                      ),

                      SizedBox(
                        height: SizeConfig.height30,
                      ),
                      InkWell(
                       onTap: () => Get.to(() => SignUpScreen()),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                  text: 'Don\'t have an Account?  ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  )),
                              TextSpan(
                                text: '  Sign Up',
                                style: TextStyle(
                                    color: AppConstant.primaryColor,
                                    fontSize: SizeConfig.font15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  _validate(String? value) {
    if (value!.isEmpty) {
      return 'form must not be empty';
    } else {
      return null;
    }
  }
}
