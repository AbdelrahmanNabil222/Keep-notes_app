import 'package:flutter/material.dart';

class CustomNoteBodyContainer extends StatelessWidget {
  const CustomNoteBodyContainer({super.key,required this.child});
    final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(15, 0, 20, 14),
         child:child);
  }
}