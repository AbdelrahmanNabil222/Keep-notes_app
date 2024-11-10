import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapps/Core/standard/colors.dart';
import 'package:noteapps/Core/standard/assets.dart';
import 'package:noteapps/View/screen/Authentication/sign%20in.dart';
import 'package:noteapps/View/widgets/CustomImageAsset.dart';
import 'package:noteapps/View/widgets/customText.dart';
import 'package:noteapps/View/widgets/customCupertinoAlertDialog.dart';
import 'package:noteapps/View/widgets/customElevatedButton.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key, required this.theEmail});
  final String? theEmail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 100,
        ),
        CustomImageAsset(
          image: AppIcons.verifyemailicon,
          height: 100,
          width: 100,
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: CustomText(
            fontWeight: FontWeight.bold,
            color: Appcolors.black,
            maxLines: 5,
            textAlign: TextAlign.center,
            text: 'Please check your gmail address',
            fontsize: 30,
          ),
        ),
        SizedBox(height: 8),
        CustomText(
          fontWeight: FontWeight.bold,
          maxLines: 10,
          textAlign: TextAlign.center,
          text: 'We sent confirmation email to:',
          fontsize: 17,
        ),
        SizedBox(
          height: 10,
        ),
        CustomText(
          fontWeight: FontWeight.bold,
          color: Appcolors.black,
          maxLines: 5,
          textAlign: TextAlign.center,
          text: '${theEmail}',
          fontsize: 18,
        ),
        SizedBox(
          height: 10,
        ),
        CustomText(
          fontWeight: FontWeight.bold,
          maxLines: 10,
          textAlign: TextAlign.center,
          text:
              'check your email address and click on the\nconfirmation link and then login.',
          fontsize: 17,
        ),
        SizedBox(height: 100),
        CustomElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return CustomCupertinoAlertDialog(
                      onPressed: () {
                        Get.offAll(() => SignInPage());
                      },
                      title: 'Warning!',
                      body:
                          'did you check your gmail address, click the link and verify email?',
                    );
                  });
            },
            text: 'Go to Login',
            color: Appcolors.brown),
      ]),
    );
  }
}
