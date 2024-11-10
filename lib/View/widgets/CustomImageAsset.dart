import 'package:flutter/material.dart';

class CustomImageAsset extends StatelessWidget {
  const CustomImageAsset(
      {super.key, required this.image, this.height, this.width});
  final String image;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: height,
      width: width,
    );
  }
}
