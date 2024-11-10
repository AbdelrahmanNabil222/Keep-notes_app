import 'package:flutter/material.dart';
import 'package:noteapps/Core/standard/colors.dart';

class CustomCupertinoAlertDialog extends StatelessWidget {
  const CustomCupertinoAlertDialog({
    super.key,
    required this.title,
    required this.body,
    this.onPressed,
    this.textbutton = 'Yes, login now',
  });
  final String title;
  final String body;
  final String textbutton;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shadowColor: Appcolors.black,
      backgroundColor: Appcolors.deepAmber,
      content: Text(body),
      contentTextStyle: TextStyle(fontSize: 16),
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      actions: [
        TextButton(
            onPressed: onPressed,
            child: Text(
              textbutton,
              style: TextStyle(fontSize: 16),
            ))
      ],
    );
  }
}
