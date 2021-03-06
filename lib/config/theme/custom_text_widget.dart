import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? align;

  const TextWidget({
    Key? key,
    this.text,
    this.textColor,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.align,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "No text assigned",
      style: TextStyle(
        color: textColor ?? Colors.red,
        fontSize: fontSize ?? 14,
        fontFamily: fontFamily ?? 'Avenir',
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      textAlign: align ?? TextAlign.start,
    );
  }
}
