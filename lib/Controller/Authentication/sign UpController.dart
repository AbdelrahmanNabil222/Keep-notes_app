import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapps/Core/standard/assets.dart';
import 'package:noteapps/View/screen/Authentication/verify%20email.dart';
import 'package:noteapps/View/screen/home.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpController extends GetxController {
  final NameFieldController = TextEditingController();
  final EmailFieldController = TextEditingController();
  final PasswordFieldController = TextEditingController();
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
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    Get.offAll(() => Home());
  }

// sign Up With Email And Password
  createUserWithEmailandPassword() async {
    try {
      var formdata = formstate.currentState;
      if (formdata!.validate()) {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: EmailFieldController.text,
          password: PasswordFieldController.text,
        );
        //verify the email
        FirebaseAuth.instance.currentUser!.sendEmailVerification();
        Get.offAll(() => VerifyEmailPage(
              theEmail: EmailFieldController.text,
            ));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
            title: '!!',
            content: Text('The account already exists for that email.'));
      }
    } catch (e) {
      print(e);
    }
  }

  //dispose fields
  @override
  void dispose() {
    NameFieldController.dispose();
    EmailFieldController.dispose();
    PasswordFieldController.dispose();
    super.dispose();
  }
}
