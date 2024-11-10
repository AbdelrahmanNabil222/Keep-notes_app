import 'package:flutter/material.dart';
import 'package:noteapps/Core/standard/colors.dart';

class CustomCircleProgressIndicator extends StatelessWidget {
  const CustomCircleProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(color: Appcolors.deepAmber);
  }
}
