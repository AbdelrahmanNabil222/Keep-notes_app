import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      this.text,
      this.fontsize,
      this.textAlign,
      this.overflow,
      this.color,
      this.maxLines,
      this.letterSpacing,
      this.fontWeight});
  final String? text;
  final double? fontsize;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final Color? color;
  final int? maxLines;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          letterSpacing: letterSpacing,
          fontSize: fontsize,
          fontWeight: fontWeight,
          color: color),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
