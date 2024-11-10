import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapps/View/screen/archievedNotes.dart';

class EditArchievedNoteController extends GetxController {
  String? docid;
  TextEditingController titleFormFieldcontroller = TextEditingController();
  TextEditingController bodyFormFieldcontroller = TextEditingController();

//Eidt Archieved Note
  eidtArchievedNote() async {
    CollectionReference archievednote =
        FirebaseFirestore.instance.collection('ArchievedNotes');

    return archievednote
        .doc(docid)
        .update({
          'NoteTitle': titleFormFieldcontroller.text,
          'NoteBody': bodyFormFieldcontroller.text,
        })
        .then((value) => Get.offAll(() => ArchievedNotes()))
        .catchError((error) =>
            Get.defaultDialog(content: Text('Failed in edit Note try again')));
  }

  @override
  void dispose() {
    titleFormFieldcontroller.dispose();
    bodyFormFieldcontroller.dispose();
    super.dispose();
  }
}
