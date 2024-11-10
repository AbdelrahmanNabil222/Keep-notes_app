import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapps/View/screen/home.dart';

class EditNoteController extends GetxController {
  TextEditingController titleFormFieldcontroller = TextEditingController();
  TextEditingController bodyFormFieldcontroller = TextEditingController();
  String? docid;

  //edit the note
  eidtnote() async {
    CollectionReference Notes = FirebaseFirestore.instance.collection('Notes');

    return Notes.doc(docid)
        .update({
          'NoteTitle': titleFormFieldcontroller.text,
          'NoteBody': bodyFormFieldcontroller.text,
        })
        .then((value) => Get.offAll(() => Home()))
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
