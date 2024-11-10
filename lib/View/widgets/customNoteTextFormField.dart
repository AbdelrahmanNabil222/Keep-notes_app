import 'package:flutter/material.dart';

class CustomNoteTextFormField extends StatelessWidget {
  const CustomNoteTextFormField({super.key, required this.hinttext, this.fontSize,required this.controller});
  final String hinttext;
  final double? fontSize;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return  Container(
            margin: EdgeInsets.symmetric(horizontal: 17),
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize:fontSize ),

              decoration: InputDecoration(
                border:InputBorder.none ,
              hintText:hinttext ,
                
              ),
            ),
          );
  }
}