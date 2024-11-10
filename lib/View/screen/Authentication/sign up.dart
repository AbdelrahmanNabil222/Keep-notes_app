import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapps/Controller/Authentication/sign%20UpController.dart';
import 'package:noteapps/Core/functions/textFormFieldValidate.dart';
import 'package:noteapps/Core/standard/colors.dart';
import 'package:noteapps/Core/standard/assets.dart';
import 'package:noteapps/View/screen/Authentication/sign%20in.dart';
import 'package:noteapps/View/widgets/Authentication/customSocialAuthButton.dart';
import 'package:noteapps/View/widgets/Authentication/customTextFormField.dart';
import 'package:noteapps/View/widgets/CustomImageAsset.dart';
import 'package:noteapps/View/widgets/customElevatedButton.dart';
import 'package:noteapps/View/widgets/Authentication/customOrContinueWithText.dart';
import 'package:noteapps/View/widgets/customText.dart';
import 'package:noteapps/View/widgets/customTextButton.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Appcolors.deepAmber2,
        title: Text(
          'Sign Up',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              SizedBox(height: 20),
              CustomText(
                fontsize: 35,
                textAlign: TextAlign.center,
                color: Appcolors.black,
                maxLines: 5,
                text: 'Welcome Sir',
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                maxLines: 10,
                fontsize: 17,
                text: 'Create your Account',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 45,
              ),
              CustomTextFormField(
                  controller: controller.NameFieldController,
                  validator: (val) {
                    //the field type, max length, min length and value
                    return textFormFieldaValidate('name', 50, 1, val!);
                  },
                  hinttext: 'name',
                  prefixicon: AppIcons.verifiedUserOutlined),
              SizedBox(height: 20),
              CustomTextFormField(
                  controller: controller.EmailFieldController,
                  validator: (val) {
                    //the field type, max length, min length and value
                    return textFormFieldaValidate('email', 50, 11, val!);
                  },
                  hinttext: 'Enter Your Email',
                  prefixicon: AppIcons.email),
              SizedBox(height: 15),
              GetBuilder<SignUpController>(
                builder: (controler) => CustomTextFormField(
                  obscuretext: controler.showwpassword,
                  controller: controller.PasswordFieldController,
                  validator: (val) {
                    //the field type, max length, min length and value
                    return textFormFieldaValidate('password', 300, 10, val!);
                  },
                  hinttext: 'Password',
                  prefixicon: AppIcons.lock,
                  suffixIcon: IconButton(
                      onPressed: () {
                        //show and hide password
                        controller.showpassword();
                      },
                      icon: CustomImageAsset(
                        image: controller.icon,
                        height: 20,
                        width: 20,
                      )),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              CustomElevatedButton(
                  onPressed: () {
                    // sign Up With Email And Password
                    controller.createUserWithEmailandPassword();
                  },
                  text: 'Sign Up',
                  color: Appcolors.deepAmber2),
              SizedBox(height: 30),
              CustomOrText(
                text: 'Or signUp with',
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSocialTextButton(
                    onPressed: () {
                      //sign up with google
                      controller.signInWithGoogle();
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'Already have an account?',
                    fontsize: 15,
                  ),
                  CustomTextButton(
                      onPressed: () {
                        Get.off(() => SignInPage());
                      },
                      text: 'Login',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Appcolors.black),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
