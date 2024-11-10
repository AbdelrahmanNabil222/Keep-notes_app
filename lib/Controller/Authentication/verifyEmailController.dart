import 'package:get/get.dart';
import 'package:noteapps/View/screen/Authentication/sign%20in.dart';

class VerifyEmailController extends GetxController {
  goToSignInPage() {
    Get.offAll(() => SignInPage());
  }
}
