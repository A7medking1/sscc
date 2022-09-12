import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test002/sc_media_app/model/register_model.dart';

import '../../../../size_config.dart';
import '../../../core/controller/auth_controller.dart';
import '../../../helper/constant.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios),
              ),
              Padding(
                padding: EdgeInsetsDirectional.all(SizeConfig.height30),
                child: Form(
                  key: _formKey,
                  child: GetBuilder<AuthController>(
                    init: Get.find<AuthController>(),
                    builder: (authController) {
                      return Column(
                        children: [
                          CustomText(
                            text: 'Sign Up',
                            fontSize: SizeConfig.font20,
                          ),
                          SizedBox(
                            height: SizeConfig.height10,
                          ),
                          CustomText(
                            text: 'Add your details to sign up',
                            fontSize: SizeConfig.font10,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: SizeConfig.height20,
                          ),
                          CustomTextFormField(
                            title: 'first name',
                            hint: 'Enter your name',
                            validator: (value) => _validate(value),
                            onSave: (value) {
                                  authController.firstName = value!;
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.height20,
                          ),
                          CustomTextFormField(
                            title: 'last name',
                            hint: 'Enter your last name',
                            validator: (value) => _validate(value),
                            onSave: (value) {
                              authController.lastName = value!;
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.height20,
                          ),
                          CustomTextFormField(
                            title: 'username',
                            hint: 'Enter your username',
                            validator: (value) => _validate(value),
                            onSave: (value) {
                             authController.userName = value!;
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.height20,
                          ),
                          CustomTextFormField(
                            title: 'Password',
                            hint: 'Your Password',
                            validator: (value) => _validate(value),
                            suffixIcon: authController.icon,
                            obscureText: authController.isPasswordShow,
                            suffixIconOnPressed: () => authController.changeObscureText(),
                            onSave: (value) {
                             authController.password = value!;
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.height40,
                          ),
                          !authController.isLoading ?
                          CustomButton(
                            text: 'Login',
                            color: AppConstant.primaryColor,
                            height: SizeConfig.height40,
                            textColor: Colors.white,
                            onTap: () async {
                              _formKey.currentState!.save();
                              if (_formKey.currentState!.validate()) {
                                RegisterModel model = RegisterModel(
                                  firstname: authController.firstName,
                                  lastname: authController.lastName,
                                  username: authController.userName,
                                  password: authController.password,
                                );
                                await authController.userRegister(model);
                              }
                            },
                          ) : const Center(child: CircularProgressIndicator()),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
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
