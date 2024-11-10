import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapps/Controller/Authentication/archievedNoteController.dart';
import 'package:noteapps/Core/standard/assets.dart';
import 'package:noteapps/Core/standard/colors.dart';
import 'package:noteapps/View/screen/home.dart';
import 'package:noteapps/View/widgets/CustomNoteTitleContainer.dart';
import 'package:noteapps/View/widgets/customCircleProgressIndicator.dart';
import 'package:noteapps/View/widgets/customNoteBodyContainer.dart';
import 'package:noteapps/View/widgets/customNoteContainer.dart';
import 'package:noteapps/View/widgets/customText.dart';
import 'package:noteapps/View/widgets/customTextButton.dart';

class ArchievedNotes extends StatefulWidget {
  const ArchievedNotes(
      {super.key, this.noteTitle, this.noteBody, this.creationdatee});

  final String? noteTitle;
  final String? noteBody;
  final String? creationdatee;

  @override
  State<ArchievedNotes> createState() => _ArchievedNotesState();
}

class _ArchievedNotesState extends State<ArchievedNotes> {
  bool isloading = true;
  List archievedData = [];
  List resultList = [];
  final TextEditingController contro = TextEditingController();
  getdata() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('ArchievedNotes')
        .where(
          'id',
          isEqualTo: FirebaseAuth.instance.currentUser!.uid,
        )
        .orderBy('creationdate', descending: true)
        .get();
    archievedData.addAll(querySnapshot.docs);
    isloading = false;
    setState(() {});

    searchresultlist();
  }

  @override
  void initState() {
    contro.addListener(onsearchchangedd);
    super.initState();
  }

  onsearchchangedd() {
    searchresultlist();
  }

  @override
  void didChangeDependencies() {
    getdata();
    super.didChangeDependencies();
  }

  searchresultlist() {
    var showresult = [];
    if (contro.text != '') {
      for (var clientssnapshot in archievedData) {
        var notebody = clientssnapshot['NoteBody'].toString().toLowerCase();
        var notetitle = clientssnapshot['NoteTitle'].toString().toLowerCase();

        if (notebody.contains(contro.text.toLowerCase()) ||
            notetitle.contains(contro.text.toLowerCase())) {
          showresult.add(clientssnapshot);
        }
      }
    } else {
      showresult = List.from(archievedData);
    }
    setState(() {
      resultList = showresult;
    });
  }

  @override
  void dispose() {
    contro.removeListener(onsearchchangedd);
    contro.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ArchievedNotesController controller = Get.find();
    return Scaffold(
      backgroundColor: Appcolors.black1,
      appBar: AppBar(
        backgroundColor: Appcolors.deepAmber,
        title: CupertinoSearchTextField(
          prefixIcon: Icon(
            AppIcons.search,
            size: 20,
          ),
          placeholder: 'Search in Archive',
          placeholderStyle: TextStyle(color: Appcolors.lightgrey),
          backgroundColor: Appcolors.deepAmber,
          itemColor: Appcolors.lightgrey,
          controller: contro,
        ),
        leading: IconButton(
            color: Appcolors.lightgrey,
            onPressed: () {
              Get.offAll(() => Home());
            },
            icon: Icon(AppIcons.arrowback)),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 25),
            child: CustomText(
              fontWeight: FontWeight.bold,
              text: 'Archive',
              color: Appcolors.lightgrey2,
              fontsize: 18,
            ),
          )
        ],
      ),
      body: (isloading == true)
          ? Center(child: CustomCircleProgressIndicator())
          : SafeArea(
              child: ListView.separated(
              itemCount: resultList.length,
              separatorBuilder: (context, i) {
                return SizedBox(height: 1);
              },
              itemBuilder: (context, i) {
                return InkWell(
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            actions: [
                              CustomTextButton(
                                  onPressed: () {
                                    // delete the note from the app
                                    controller.deleteTheNote(
                                        Docid: resultList[i].id);
                                  },
                                  text: 'delete',
                                  color: Appcolors.black),
                              CustomTextButton(
                                  onPressed: () {
                                    //Un Archieve the Note by delete it from the archieve page and add it to home page
                                    controller.UnArchieveTheNote(
                                        noteTitle: resultList[i]['NoteTitle'],
                                        noteBody: resultList[i]['NoteBody'],
                                        creationdateArch: resultList[i]
                                            ['creationdate'],
                                        docid: resultList[i].id);
                                  },
                                  text: 'Un Archive',
                                  color: Appcolors.black),
                            ],
                          );
                        });
                  },
                  onTap: () {
                    // go to the  Edit archieved Note Page
                    controller.gotoEditarchievedNotePage(
                        docid: resultList[i].id,
                        titlefieldoldvalue: resultList[i]['NoteTitle'],
                        bodyfieldoldvalue: resultList[i]['NoteBody'],
                        datetimee: resultList[i]['creationdate']);
                  },
                  child: CustomNoteContainer(
                    child: Column(
                      children: [
                        CustomNoteTitleContainer(
                            child: CustomText(
                                text: '${resultList[i]['NoteTitle']}',
                                color: Appcolors.white,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.left,
                                fontsize: 19)),
                        CustomNoteBodyContainer(
                          child: CustomText(
                            text: '${resultList[i]['NoteBody']}',
                            color: Appcolors.lightgrey,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                            fontsize: 14,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
    );
  }
}
