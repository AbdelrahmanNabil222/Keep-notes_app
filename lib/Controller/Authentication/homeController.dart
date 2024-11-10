import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:noteapps/View/screen/Authentication/sign%20in.dart';
import 'package:noteapps/View/screen/archievedNotes.dart';
import 'package:noteapps/View/screen/editNotePage.dart';
import 'package:noteapps/View/screen/home.dart';

class HomeController extends GetxController {
  //signout function
  signOut() async {
    GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => SignInPage());
  }

  //delete the note from home page
  deleteNote(String? deleteDocid) async {
    Get.defaultDialog(
        titleStyle: TextStyle(fontSize: 18),
        title: 'Are you sure ?',
        content: Text('delete Note.'),
        textConfirm: 'Yes',
        onConfirm: () async {
          await FirebaseFirestore.instance
              .collection('Notes')
              .doc(deleteDocid)
              .delete();
          Get.offAll(() => Home());
        });
  }

// go to the edit note page
  goToEditNotePage(
      {String? docid,
      String? titlefieldoldvalue,
      String? bodyfieldoldvalue,
      String? datetimee}) {
    Get.to(() => EditNotePage(
          datetime: datetimee!,
          docid: docid!,
          titleFieldoldvalue: titlefieldoldvalue!,
          bodyFieldoldvalue: bodyfieldoldvalue!,
        ));
  }

  //move The Note To Archieve by deleting the note from home page and adding the note to archieve page
  moveNoteToArchieve(
      {String? noteTitle,
      String? noteBody,
      String? docid,
      String? creationdatee}) async {
// delete home note
    await FirebaseFirestore.instance.collection('Notes').doc(docid).delete();
    // go to archieve
    Get.offAll(() => ArchievedNotes(
          noteTitle: noteTitle,
          noteBody: noteBody,
          creationdatee: creationdatee,
        ));
// add the note to archieve
    CollectionReference archievedNotes =
        FirebaseFirestore.instance.collection('ArchievedNotes');
    return archievedNotes
        .add({
          'NoteTitle': noteTitle,
          'NoteBody': noteBody,
          'id': FirebaseAuth.instance.currentUser!.uid,
          'creationdate': creationdatee,
          'email': FirebaseAuth.instance.currentUser!.email
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
