import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapps/View/screen/Authentication/checkGmailToResetPass.dart';

class ForgetPasswordController extends GetxController {
  final EmailFieldController = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  //send Reset password link to gmail
  sendresetpasswordlink() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      FirebaseAuth.instance
          .sendPasswordResetEmail(email: EmailFieldController.text);
    }
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// what yhe validate
  //go To Password Changed Success Page
  goToPasswordChangedSuccessPage() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      Get.offAll(() => CheckGmailToResetPassPage());
    }
  }

  @override
  void dispose() {
    EmailFieldController.dispose();
    super.dispose();
  }
}
