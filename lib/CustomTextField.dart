import 'package:assign4_flutter/colors.dart';
import 'package:flutter/material.dart';

class customtextfield extends StatelessWidget{
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?) validator;

  const customtextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: colors.color4,
      style: TextStyle(
        color: colors.color4,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: colors.color4) ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:  BorderSide(color: colors.color4),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:  BorderSide(color:colors.color4 ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:  BorderSide(color: colors.color4),
        ),
      ),
    );
  }
}