import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapps/Controller/Authentication/sign%20InController.dart';
import 'package:noteapps/Core/functions/textFormFieldValidate.dart';
import 'package:noteapps/Core/standard/colors.dart';
import 'package:noteapps/Core/standard/assets.dart';
import 'package:noteapps/View/screen/Authentication/forget%20password.dart';
import 'package:noteapps/View/screen/Authentication/sign%20up.dart';
import 'package:noteapps/View/widgets/Authentication/customSocialAuthButton.dart';
import 'package:noteapps/View/widgets/Authentication/customTextFormField.dart';
import 'package:noteapps/View/widgets/CustomImageAsset.dart';
import 'package:noteapps/View/widgets/customElevatedButton.dart';
import 'package:noteapps/View/widgets/Authentication/customOrContinueWithText.dart';
import 'package:noteapps/View/widgets/customText.dart';
import 'package:noteapps/View/widgets/customTextButton.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Appcolors.deepAmber2,
        title: CustomText(
          text: 'Sign In',
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Form(
        key: controller.formstate,
        child: Center(
          child: ListView(
            children: [
              const SizedBox(height: 35),
              CustomText(
                fontWeight: FontWeight.bold,
                color: Appcolors.black,
                maxLines: 5,
                textAlign: TextAlign.center,
                text: 'Welcome back',
                fontsize: 35,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                fontWeight: FontWeight.bold,
                maxLines: 10,
                fontsize: 16,
                textAlign: TextAlign.center,
                text: 'Login to your Account',
              ),
              SizedBox(
                height: 45,
              ),
              CustomTextFormField(
                controller: controller.EmailFieldcontroller,
                validator: (val) {
                  //the field type, max length, min length and value
                  return textFormFieldaValidate('email', 50, 11, val!);
                },
                hinttext: 'Your Email',
                prefixicon: AppIcons.email,
              ),
              SizedBox(height: 18),
              GetBuilder<SignInController>(
                builder: (controllerr) => CustomTextFormField(
                  obscuretext: controllerr.showwpassword,
                  controller: controllerr.PasswordFieldController,
                  validator: (val) {
                    //the field type, max length, min length and value
                    return textFormFieldaValidate('password', 300, 10, val!);
                  },
                  hinttext: 'Password',
                  prefixicon: AppIcons.lock,
                  suffixIcon: IconButton(
                      onPressed: () {
                        //show and hide password
                        controllerr.showpassword();
                      },
                      icon: CustomImageAsset(
                        image: controller.icon,
                        height: 20,
                        width: 20,
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 180),
                child: CustomTextButton(
                    text: 'Forget Password?',
                    fontSize: 18,
                    color: Appcolors.black,
                    fontWeight: FontWeight.bold,
                    onPressed: () {
                      Get.to(() => ForgetPasswordPage());
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              CustomElevatedButton(
                  onPressed: () {
                    //sign In With Email And Password
                    controller.signInWithEmailAndPassword();
                  },
                  text: 'Login',
                  color: Appcolors.deepAmber),
              SizedBox(height: 35),
              CustomOrText(text: 'Or Login with'),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSocialTextButton(
                    onPressed: () {
                      //sign in with google
                      controller.signInWithGoogle();
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'Don\'t have an account?',
                    fontsize: 15,
                  ),
                  CustomTextButton(
                      onPressed: () {
                        Get.off(() => SignUpPage());
                      },
                      text: 'SignUp',
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
