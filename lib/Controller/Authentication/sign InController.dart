import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapps/Core/standard/assets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:noteapps/View/screen/home.dart';

class SignInController extends GetxController {
  final PasswordFieldController = TextEditingController();
  final EmailFieldcontroller = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

//show and hide password
  bool showwpassword = true;
  String icon = 'Icons/hide.png';
  showpassword() {
    if (showwpassword == true) {
      showwpassword = false;
      icon = AppIcons.visibleicon;
    } else {
      showwpassword = true;
      icon = AppIcons.hiddenicon;
    }
    update();
  }

// sign in with google
  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }
    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    Get.offAll(() => Home());
  }

// sign In With Email And Password
  signInWithEmailAndPassword() async {
    try {
      var formdata = formstate.currentState;
      if (formdata!.validate()) {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: EmailFieldcontroller.text,
          password: PasswordFieldController.text,
        );
        //check if the user verify the email
        if (credential.user!.emailVerified) {
          Get.offAll(() => Home());
        } else if (!credential.user!.emailVerified) {
          Get.defaultDialog(
              title: '!!',
              titleStyle: TextStyle(fontSize: 18),
              content: Text(
                'You should verify your email first by go to your gmail address and click the link we sent',
                textAlign: TextAlign.center,
              ));
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        //   Get.defaultDialog(title: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // Get.defaultDialog(content: Text('Wrong Password'));
      }
      Get.defaultDialog(
          title: 'error',
          content: Text(
            'make sure that you are write your email and password correct',
            textAlign: TextAlign.center,
          ));
    }
  }

  // dispose fields
  @override
  void dispose() {
    PasswordFieldController.dispose();
    EmailFieldcontroller.dispose();
    super.dispose();
  }
}
