import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapps/Controller/addNoteController.dart';
import 'package:noteapps/Core/standard/colors.dart';
import 'package:noteapps/View/widgets/customNoteTextFormField.dart';
import 'package:noteapps/View/widgets/customText.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});
  @override
  Widget build(BuildContext context) {
    final AddNoteController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          fontWeight: FontWeight.bold,
          color: Appcolors.black,
          maxLines: 5,
          textAlign: TextAlign.center,
          text: 'Add Your Note',
        ),
        backgroundColor: Appcolors.deepAmber,
      ),
      body: PopScope(
        canPop: true,
        //when i click on the back button from appbar ,add the note
        onPopInvoked: (bool x) {
          controller.addnote();
        },
        child: SafeArea(
            child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            CustomNoteTextFormField(
                hinttext: 'Title',
                fontSize: 22,
                controller: controller.titleFormFieldcontroller),
            CustomNoteTextFormField(
                hinttext: 'Note',
                controller: controller.bodyFormFieldcontroller),
            SizedBox(height: 120),
          ],
        )),
      ),
    );
  }
}
