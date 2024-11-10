import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapps/View/screen/archievedNotes.dart';
import 'package:noteapps/View/screen/editArchievedNotePage.dart';
import 'package:noteapps/View/screen/home.dart';

class ArchievedNotesController extends GetxController {
  // delete the note from the app
  deleteTheNote({String? Docid}) async {
    Get.defaultDialog(
        title: 'Are you sure ?',
        titleStyle: TextStyle(fontSize: 18),
        content: Text('delete Note.'),
        textConfirm: 'Yes',
        onConfirm: () async {
          await FirebaseFirestore.instance
              .collection('ArchievedNotes')
              .doc(Docid)
              .delete();
          Get.offAll(() => ArchievedNotes());
        });
  }

  //Un Archieve the Note by delete it from the archieve page and add it to home page
  UnArchieveTheNote(
      {String? noteTitle,
      String? noteBody,
      String? creationdateArch,
      String? docid}) async {
// delete the archieved note
    await FirebaseFirestore.instance
        .collection('ArchievedNotes')
        .doc(docid)
        .delete();
    // go to home
    Get.offAll(() => Home(
          noteTitle: noteTitle,
          noteBody: noteBody,
          creationdateArch: creationdateArch,
        ));
// add the note to Home
    CollectionReference notes = FirebaseFirestore.instance.collection('Notes');
    return notes
        .add({
          'NoteTitle': noteTitle,
          'NoteBody': noteBody,
          'id': FirebaseAuth.instance.currentUser!.uid,
          'creationdate': creationdateArch,
          'email': FirebaseAuth.instance.currentUser!.email
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

////////////////////////
  // go to Edit archieved Note Page
  gotoEditarchievedNotePage(
      {String? docid,
      String? titlefieldoldvalue,
      String? bodyfieldoldvalue,
      String? datetimee}) {
    Get.to(() => EditArchievedNotePage(
          datetime: datetimee!,
          docid: docid!,
          titleFieldoldvalue: titlefieldoldvalue!,
          bodyFieldoldvalue: bodyfieldoldvalue!,
        ));
  }
}
