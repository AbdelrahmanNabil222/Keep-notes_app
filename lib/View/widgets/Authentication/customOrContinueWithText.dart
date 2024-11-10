import 'package:flutter/material.dart';
import 'package:noteapps/Core/standard/colors.dart';

class CustomOrText extends StatelessWidget {
  const CustomOrText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 100,
            child: Divider(
              color: Appcolors.black4,
              thickness: 3,
            )),
        Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 17,
                color: Appcolors.black5,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            width: 100,
            child: Divider(
              color: Appcolors.black4,
              thickness: 3,
            )),
      ],
    );
  }
}
