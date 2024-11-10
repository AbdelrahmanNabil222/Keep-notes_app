import 'package:get/get.dart';
import 'package:noteapps/Controller/Authentication/archievedNoteController.dart';
import 'package:noteapps/Controller/Authentication/forget%20PasswordController.dart';
import 'package:noteapps/Controller/Authentication/homeController.dart';
import 'package:noteapps/Controller/Authentication/sign%20InController.dart';
import 'package:noteapps/Controller/Authentication/sign%20UpController.dart';
import 'package:noteapps/Controller/addNoteController.dart';
import 'package:noteapps/Controller/editArchievedNoteController.dart';
import 'package:noteapps/Controller/editNoteController.dart';

class mybindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController(), fenix: true);
    Get.put(SignInController());
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => AddNoteController(), fenix: true);
    Get.lazyPut(() => EditNoteController(), fenix: true);
    Get.lazyPut(() => ArchievedNotesController(), fenix: true);
    Get.lazyPut(() => EditArchievedNoteController(), fenix: true);
  }
}
