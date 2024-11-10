import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapps/Core/standard/colors.dart';
import 'package:noteapps/View/screen/Authentication/sign%20in.dart';
import 'package:noteapps/View/screen/Authentication/sign%20up.dart';
import 'package:noteapps/View/widgets/customElevatedButton.dart';
import 'package:noteapps/View/widgets/customText.dart';
import 'package:noteapps/View/widgets/customTextButton.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Appcolors.brown,
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.fromLTRB(25, 5, 120, 0),
                child: CustomText(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontsize: 48,
                  text: 'The best\napp for\nyour notes',
                  color: Appcolors.lightgrey5,
                  textAlign: TextAlign.left,
                )),
            SizedBox(height: 250),
            CustomElevatedButton(
                onPressed: () {
                  Get.off(() => SignInPage());
                },
                text: 'Sign in',
                color: Appcolors.black),
            SizedBox(
              height: 4,
            ),
            CustomTextButton(
              onPressed: () {
                Get.off(() => SignUpPage());
              },
              fontWeight: FontWeight.bold,
              maxLines: 5,
              textAlign: TextAlign.center,
              text: 'create an account',
              fontSize: 17,
              color: Appcolors.lightgrey2,
            )
          ],
        )));
  }
}
