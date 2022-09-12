import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final double? height;
  final String? text;
  final Color? textColor;
  final Color? color;
  final IconData? icon;

  const CustomButton({
    Key? key,
    required this.onTap,
    this.height,
    this.icon,
    this.text,
    this.textColor = Colors.black,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: color,
        height: height,
        child: CustomText(
          text: text,
          color: textColor,
        ),
      ),
    );
  }
}
