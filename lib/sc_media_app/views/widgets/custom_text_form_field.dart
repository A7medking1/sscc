import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String? title;
  final String? hint;
  final IconData? icon;
  final double? hintSize ;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final void Function(String?)? onSave;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final Function()? suffixIconOnPressed;

  const CustomTextFormField({
    Key? key,
    required this.title,
    this.validator,
    this.hintSize ,
    this.suffixIconOnPressed,
    this.suffixIcon,
    this.controller,
    required this.hint,
    this.icon,
    this.onSave,
    this.obscureText = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          alignment: Alignment.topLeft,
          text: title,
          color: Colors.black,
          fontSize: SizeConfig.font15,
        ),
         SizedBox(
          height: SizeConfig.height10 / 2.5,
        ),
        TextFormField(
          onTap: onTap,
          obscureText: obscureText,
          onSaved: onSave,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            suffixIcon: suffixIcon != null
                ? IconButton(onPressed: suffixIconOnPressed, icon: Icon(suffixIcon))
                : null,
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: hintSize ?? SizeConfig.font10,
              color: Colors.grey[500],
            ),
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
