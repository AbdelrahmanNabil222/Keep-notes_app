import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapps/Controller/Authentication/forget%20PasswordController.dart';
import 'package:noteapps/Core/functions/textFormFieldValidate.dart';
import 'package:noteapps/Core/standard/colors.dart';
import 'package:noteapps/Core/standard/assets.dart';
import 'package:noteapps/View/widgets/Authentication/customTextFormField.dart';
import 'package:noteapps/View/widgets/customText.dart';
import 'package:noteapps/View/widgets/customElevatedButton.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgetPasswordController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.brown,
        centerTitle: true,
        title: CustomText(
          text: 'Reset Password',
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 22),
                child: CustomText(
                  maxLines: 10,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                  text:
                      'Enter the email address you used to Sign In and we\'ll send you link to your email address to reset password.',
                  fontsize: 17,
                ),
              ),
              SizedBox(height: 30),
              CustomTextFormField(
                  controller: controller.EmailFieldController,
                  validator: (val) {
                    //the field type, max length, min length and value
                    return textFormFieldaValidate('email', 50, 11, val!);
                  },
                  hinttext: 'Enter Your Email',
                  prefixicon: AppIcons.email),
              SizedBox(height: 90),
              CustomElevatedButton(
                  onPressed: () {
                    //send Reset password link to gmail
                    //go To Password Changed Success Page
                    controller.sendresetpasswordlink();
                    controller.goToPasswordChangedSuccessPage();
                  },
                  text: 'Request password reset',
                  color: Appcolors.brown)
            ],
          ),
        ),
      ),
    );
  }
}
