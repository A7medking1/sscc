import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData? icon;
  final void Function()? onTap;
  final Color? color;

  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: color,
        ),
    );
  }
}



// Container(
// child: CustomIconButton(
// icon: Icons.remove,
// onTap: () {},
// color: Colors.white,
// ),
// height: 40,
// width: 40,
// decoration: BoxDecoration(
// color: primaryColor,
// borderRadius: BorderRadius.circular(20),
// ),
// ),
