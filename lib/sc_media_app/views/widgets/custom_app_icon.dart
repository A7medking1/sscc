import 'package:flutter/material.dart';


class AppIcon extends StatelessWidget
{
  final double size;
  final double iconSize;
  final IconData? icon;

  final Color iconColor;
  final Color color;
  final void Function()? onTap;

  const AppIcon({
    Key? key,
    required this.size,
    required this.icon,
    required this.iconSize,
    this.iconColor = Colors.white,
    this.color = Colors.deepOrange,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(size / 2),
        ),
      ),
    );
  }
}
