import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      this.onPressed,
      required this.text,
      this.fontSize,
      this.color,
      this.fontWeight,
      this.textAlign,
      this.maxLines});
  final Function()? onPressed;
  final int? maxLines;
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          maxLines: maxLines,
          textAlign: textAlign,
          text,
          style: TextStyle(
              fontSize: fontSize, fontWeight: fontWeight, color: color),
        ));
  }
}
