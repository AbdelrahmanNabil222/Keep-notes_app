import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapps/Controller/editNoteController.dart';
import 'package:noteapps/Core/standard/colors.dart';
import 'package:noteapps/View/widgets/customNoteTextFormField.dart';
import 'package:noteapps/View/widgets/customText.dart';

class EditNotePage extends StatelessWidget {
  EditNotePage({
    super.key,
    required this.docid,
    required this.bodyFieldoldvalue,
    required this.titleFieldoldvalue,
    required this.datetime,
  });
  final String docid;
  final String bodyFieldoldvalue;
  final String titleFieldoldvalue;
  final String datetime;
  @override
  Widget build(BuildContext context) {
    final EditNoteController controller = Get.find();
    controller.docid = docid;
    controller.titleFormFieldcontroller.text = titleFieldoldvalue;
    controller.bodyFormFieldcontroller.text = bodyFieldoldvalue;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Appcolors.deepAmber,
        ),
        body: PopScope(
            canPop: true,
            //when i click on the back button from appbar ,save the edits of the note
            onPopInvoked: (bool dippop) {
              controller.eidtnote();
            },
            child: SafeArea(
                child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CustomNoteTextFormField(
                          controller: controller.titleFormFieldcontroller,
                          hinttext: 'Title',
                          fontSize: 22),
                      CustomNoteTextFormField(
                          controller: controller.bodyFormFieldcontroller,
                          hinttext: 'Note'),
                      SizedBox(
                        height: 200,
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 40,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          fontWeight: FontWeight.bold,
                          maxLines: 10,
                          text: 'CREATED IN :',
                          fontsize: 13,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        CustomText(
                          fontWeight: FontWeight.bold,
                          maxLines: 10,
                          text: datetime.toString(),
                          fontsize: 14,
                        ),
                      ],
                    )),
              ],
            ))));
  }
}
