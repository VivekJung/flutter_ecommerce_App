import 'package:ecommerce_app/config/theme/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final BuildContext context;
  final Color? bgColor;
  final Color? textColor, iconColor;
  final double? elevation;
  final Function()? buttonFunction;
  final IconData icon;
  final String? iconLabelText;
  const CustomIconButton(
      {Key? key,
      required this.context,
      this.bgColor,
      required this.iconColor,
      this.buttonFunction,
      required this.icon,
      this.iconLabelText,
      this.textColor,
      this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: bgColor ?? Colors.black,
          shape: const RoundedRectangleBorder(),
          elevation: elevation ?? 1),
      onPressed: buttonFunction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 3),
          Icon(icon, color: iconColor),
          // iconButton(() {}, context, icon, iconColor),
          iconLabelText == null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(top: 3.0, bottom: 2.0),
                  child: TextWidget(
                    text: iconLabelText,
                    fontSize: 10,
                    textColor: textColor ?? Colors.white,
                  ),
                ),
          // const SizedBox(width: 10),
        ],
      ),
    );
  }
}
