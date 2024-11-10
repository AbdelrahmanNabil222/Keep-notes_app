import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:noteapps/View/screen/home.dart';

class AddNoteController extends GetxController {
  TextEditingController titleFormFieldcontroller = TextEditingController();
  TextEditingController bodyFormFieldcontroller = TextEditingController();
  // add the note
  addnote() {
    CollectionReference Notes = FirebaseFirestore.instance.collection('Notes');
    return Notes.add({
      'NoteTitle': titleFormFieldcontroller.text,
      'NoteBody': bodyFormFieldcontroller.text,
      'id': FirebaseAuth.instance.currentUser!.uid,
      'email': FirebaseAuth.instance.currentUser!.email,
      'creationdate': DateTime.now().toString(),
    }).then((value) => Get.offAll(() => Home())).catchError((error) =>
        Get.defaultDialog(content: Text('Failed in Added Note try again')));
  }

  //dispose the fields
  @override
  void dispose() {
    titleFormFieldcontroller.dispose();
    bodyFormFieldcontroller.dispose();
    super.dispose();
  }
}
