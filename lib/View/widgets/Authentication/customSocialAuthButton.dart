import 'package:flutter/material.dart';
import 'package:noteapps/Core/standard/assets.dart';

class CustomSocialTextButton extends StatelessWidget {
  const CustomSocialTextButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Image.asset(
          AppIcons.google,
          height: 41,
          width: 41,
        ));
  }
}
