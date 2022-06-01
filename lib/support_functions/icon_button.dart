import 'package:flutter/material.dart';

iconButton(
  Function()? function,
  BuildContext? context,
  IconData? icon,
  Color? color,
) {
  return GestureDetector(
    onTap: function ?? () {},
    child: Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Icon(icon, color: color ?? Colors.white),
    ),
  );
}
