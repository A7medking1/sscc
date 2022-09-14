import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test002/sc_media_app/core/controller/home_controller.dart';
import 'package:test002/sc_media_app/model/add_post_model.dart';
import 'package:test002/sc_media_app/views/widgets/custom_button.dart';
import 'package:test002/sc_media_app/views/widgets/custom_text.dart';

import '../../../size_config.dart';
import '../../helper/constant.dart';
import '../widgets/custom_text_form_field.dart';

class AddPostScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: Get.find<HomeController>(),
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomText(
                text: 'Add New Post',
                fontSize: SizeConfig.font20,
                color: Colors.grey,
              ),
              SizedBox(
                height: SizeConfig.height20,
              ),
              CustomTextFormField(
                title: 'Caption',
                hint: 'Enter your Caption',
                validator: (value) => _validate(value),
                onSave: (value) {
                  controller.caption = value;
                },
              ),
              SizedBox(
                height: SizeConfig.height20,
              ),
              CustomTextFormField(
                title: 'profile Image url',
                hint: 'Enter your profile Image url',
                validator: (value) => _validate(value),
                onSave: (value) {
                  controller.displayPicture = value;
                },
              ),
              SizedBox(
                height: SizeConfig.height20,
              ),
              CustomTextFormField(
                title: 'image url',
                hint: 'image url',
                validator: (value) => _validate(value),
                onSave: (value) {
                  controller.displayContent = value;
                },
              ),
              SizedBox(
                height: SizeConfig.height20,
              ),
              SizedBox(
                height: SizeConfig.height40,
              ),
              !controller.isLoading
                  ? CustomButton(
                      text: 'Add New Post',
                      color: AppConstant.primaryColor,
                      height: SizeConfig.height40,
                      textColor: Colors.white,
                      onTap: () async {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()){
                          AddPostModel addPost = AddPostModel(
                            caption: controller.caption,
                            display_content: controller.displayContent,
                            display_picture: controller.displayPicture,
                          );
                          await controller.addPosts(addPost);
                        }
                      },
                    )
                  : const Center(child: CircularProgressIndicator()),
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
