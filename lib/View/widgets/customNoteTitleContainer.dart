import 'package:flutter/material.dart';

class CustomNoteTitleContainer extends StatelessWidget {
  const CustomNoteTitleContainer({super.key, required this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(15, 10, 48, 7),
        child: child);
  }
}
