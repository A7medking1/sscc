
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageName;
  final Color color;
  final void Function() onPress;

    const CustomButtonSocial({Key? key,
    required this.text,
      required this.color,
    required this.imageName,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Container(
      height: SizeConfig.height40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.radius20),
        color: color ,
      ),
      child: TextButton(
        onPressed: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(imageName),
            CustomText(
              text: text,
              color: Colors.white,
              fontSize: SizeConfig.font15,
            ),
          ],
        ),
      ),
    );
  }
}