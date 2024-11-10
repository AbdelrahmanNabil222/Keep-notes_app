import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapps/Core/standard/assets.dart';
import 'package:noteapps/Core/standard/colors.dart';
import 'package:noteapps/View/screen/Authentication/sign%20in.dart';
import 'package:noteapps/View/widgets/CustomImageAsset.dart';
import 'package:noteapps/View/widgets/customText.dart';
import 'package:noteapps/View/widgets/customCupertinoAlertDialog.dart';
import 'package:noteapps/View/widgets/customElevatedButton.dart';

class CheckGmailToResetPassPage extends StatelessWidget {
  const CheckGmailToResetPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            CustomImageAsset(
              image: AppIcons.resertpasswordicon,
              height: 170.0,
              width: 170.0,
            ),
            SizedBox(
              height: 50,
            ),
            CustomText(
                fontWeight: FontWeight.bold,
                maxLines: 5,
                color: Appcolors.black,
                textAlign: TextAlign.center,
                text: 'Check your email address',
                fontsize: 30),
            SizedBox(height: 8),
            CustomText(
              fontWeight: FontWeight.bold,
              maxLines: 10,
              textAlign: TextAlign.center,
              text:
                  'We sent to your email address a link to reset password and then you can login.',
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
                              'did you check your gmail address, click the link and resert password?',
                        );
                      });
                },
                text: 'Login now',
                color: Appcolors.brown)
          ],
        ),
      )),
    );
  }
}
