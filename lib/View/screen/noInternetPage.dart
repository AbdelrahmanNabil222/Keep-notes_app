import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapps/Core/standard/colors.dart';
import 'package:noteapps/View/screen/home.dart';
import 'package:noteapps/View/widgets/CustomImageAsset.dart';
import 'package:noteapps/View/widgets/customElevatedButton.dart';
import 'package:noteapps/View/widgets/customText.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Appcolors.deepwhite,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageAsset(
              image: 'images/internet.PNG',
            ),
            SizedBox(height: 50),
            CustomText(
              fontWeight: FontWeight.bold,
              text:
                  'No internet connection found, check your connection and try again.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CustomElevatedButton(
                onPressed: () {
                  Get.offAll(() => Home());
                },
                text: 'Reload'),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
