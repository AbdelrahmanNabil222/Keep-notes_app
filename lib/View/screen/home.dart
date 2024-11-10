import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapps/Controller/Authentication/homeController.dart';
import 'package:noteapps/Core/standard/colors.dart';
import 'package:noteapps/Core/standard/assets.dart';
import 'package:noteapps/View/screen/addNotePage.dart';
import 'package:noteapps/View/screen/archievedNotes.dart';
import 'package:noteapps/View/widgets/CustomNoteTitleContainer.dart';
import 'package:noteapps/View/widgets/customCupertinoAlertDialog.dart';
import 'package:noteapps/View/widgets/customNoteBodyContainer.dart';
import 'package:noteapps/View/widgets/customNoteContainer.dart';
import 'package:noteapps/View/widgets/customText.dart';
import 'package:noteapps/View/widgets/customTextButton.dart';

class Home extends StatefulWidget {
  const Home(
      {super.key,
      this.docid,
      this.noteTitle,
      this.noteBody,
      this.creationdateArch});
  final String? docid;
  final String? noteTitle;
  final String? noteBody;
  final String? creationdateArch;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchame = TextEditingController();

  bool isloading = true;
  List data = [];
  List resultList = [];
  final TextEditingController contro = TextEditingController();
  getdata() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Notes')
        .where(
          'id',
          isEqualTo: FirebaseAuth.instance.currentUser!.uid,
        )
        .orderBy('creationdate', descending: true)
        .get();
    data.addAll(querySnapshot.docs);
    isloading = false;
    setState(() {});
    searchresultlist();
  }

  @override
  void didChangeDependencies() {
    getdata();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    contro.addListener(onsearchchangedd);

    super.initState();
  }

  onsearchchangedd() {
    searchresultlist();
  }

  searchresultlist() {
    var showresult = [];
    if (contro.text != '') {
      for (var clientssnapshot in data) {
        var notebody = clientssnapshot['NoteBody'].toString().toLowerCase();
        var notetitle = clientssnapshot['NoteTitle'].toString().toLowerCase();

        if (notebody.contains(contro.text.toLowerCase()) ||
            notetitle.contains(contro.text.toLowerCase())) {
          showresult.add(clientssnapshot);
        }
      }
    } else {
      showresult = List.from(data);
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
    final HomeController controller = Get.find();
    return Scaffold(
      backgroundColor: Appcolors.black1,
      floatingActionButton: Container(
        height: 50,
        width: 51,
        child: FloatingActionButton(
          onPressed: () {
            Get.to(() => AddNotePage());
          },
          foregroundColor: Appcolors.black,
          backgroundColor: Appcolors.deepAmber,
          child: Icon(AppIcons.add),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: Appcolors.black2,
        title: CupertinoSearchTextField(
          prefixIcon: Icon(
            AppIcons.search,
            size: 20,
          ),
          placeholder: 'Search',
          placeholderStyle: TextStyle(color: Appcolors.lightgrey2),
          backgroundColor: Appcolors.black3,
          itemColor: Appcolors.lightgrey2,
          controller: contro,
        ),
        leading: Icon(AppIcons.home, color: Appcolors.lightgrey4),
        actions: [
          PopupMenuButton(
              iconColor: Appcolors.lightgrey,
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: CustomText(
                        text: 'Archive',
                        fontWeight: FontWeight.bold,
                      ),
                      onTap: () {
                        Get.offAll(() => ArchievedNotes());
                      },
                    ),
                    PopupMenuItem(
                      child: CustomText(
                        text: 'LogOut',
                        fontWeight: FontWeight.bold,
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return CustomCupertinoAlertDialog(
                                  title: 'LogOut',
                                  body: 'do you want to Logout?',
                                  textbutton: 'Yes, logOut',
                                  onPressed: () {
                                    //signout function
                                    controller.signOut();
                                  });
                            });
                      },
                    ),
                  ])
        ],
      ),
      body: SafeArea(
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
                              // delete the note from home page
                              controller.deleteNote(resultList[i].id);
                            },
                            fontWeight: FontWeight.bold,
                            text: 'delete',
                            color: Appcolors.black),
                        CustomTextButton(
                          onPressed: () {
                            //move The Note To Archieve by deleting the note from home page and adding the note to archieve page
                            controller.moveNoteToArchieve(
                                noteTitle: resultList[i]['NoteTitle'],
                                noteBody: resultList[i]['NoteBody'],
                                docid: resultList[i].id,
                                creationdatee: resultList[i]['creationdate']);
                          },
                          fontWeight: FontWeight.bold,
                          text: 'Archive',
                          color: Appcolors.black,
                        )
                      ],
                    );
                  });
            },
            onTap: () {
              // go To Edit Note Page
              controller.goToEditNotePage(
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
                          fontWeight: FontWeight.bold,
                          maxLines: 5,
                          color: Appcolors.white,
                          textAlign: TextAlign.left,
                          text: '${resultList[i]['NoteTitle']}',
                          fontsize: 19)),
                  CustomNoteBodyContainer(
                    child: CustomText(
                      fontWeight: FontWeight.bold,
                      maxLines: 5,
                      color: Appcolors.lightgrey,
                      text: '${resultList[i]['NoteBody']}',
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
