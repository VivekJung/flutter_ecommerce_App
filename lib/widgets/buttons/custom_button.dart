import 'package:ecommerce_app/config/theme/custom_text_widget.dart';
import 'package:ecommerce_app/support_functions/icon_button.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final BuildContext context;
  final Color bgColor, iconColor;
  final Function()? buttonFunction;
  final IconData icon;
  final String? iconLabelText;
  const CustomIconButton(
      {Key? key,
      required this.context,
      required this.bgColor,
      required this.iconColor,
      this.buttonFunction,
      required this.icon,
      this.iconLabelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: bgColor),
      onPressed: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconButton(buttonFunction, context, icon, iconColor),
          iconLabelText == null
              ? Container()
              : TextWidget(
                  text: iconLabelText,
                  fontSize: 10,
                  textColor: Colors.white,
                ),
          // const SizedBox(width: 10),
        ],
      ),
    );
  }
}
