import 'package:flutter/material.dart';
import 'package:noteapps/Core/standard/colors.dart';

class CustomNoteContainer extends StatelessWidget {
  const CustomNoteContainer({super.key, required this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: child,
        margin: EdgeInsets.fromLTRB(10, 12.4, 10, 8),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: Appcolors.brown, width: .5),
            boxShadow: [
              BoxShadow(color: Appcolors.amber, spreadRadius: 5, blurRadius: 10)
            ],
            borderRadius: BorderRadius.circular(10),
            color: Appcolors.black
            //Color.fromARGB(248, 245, 154, 18)
            //Color.fromARGB(253, 243, 152, 15)
            // Color.fromARGB(239, 243, 152, 15)
            // Color.fromARGB(248, 243, 152, 15)
            //Color.fromARGB(255, 243, 152, 15)
            // Color(0xffc107),
            ));
  }
}
