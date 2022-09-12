import 'package:flutter/material.dart';

import '../../../size_config.dart';

class CustomText extends StatelessWidget
{
  final String? text;
  final Alignment? alignment;
  final Color? color;
  final int? maxLine;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;

   const CustomText({Key? key,
    this.height,
    this.fontSize = 0,
    this.maxLine,
     this.textOverflow,
    this.fontWeight = FontWeight.bold,
    this.color = Colors.black,
    this.alignment = Alignment.center,
    this.text = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Container(
      alignment: alignment,
      child: Text(
        text.toString(),
        maxLines: maxLine,
        overflow: textOverflow,
        style: TextStyle(
          color:  color ,
          fontSize: fontSize == 0 ? SizeConfig.font15 : fontSize,
          height: height,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
