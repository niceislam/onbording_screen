import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.hinttext,
    this.preIcon,
    this.sufIcon,
    this.controller,
    this.onchanged,
    this.validator,
    this.border,
    this.contentPading,
    this.obsecureTxt,
  });
  final String? hinttext;
  final Icon? preIcon;
  final InkWell? sufIcon;
  final TextEditingController? controller;
  final ValueChanged? onchanged;
  final FormFieldValidator? validator;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPading;
  final bool? obsecureTxt;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      obscureText: obsecureTxt ?? false,
      cursorColor: Colors.black,
      onChanged: onchanged,
      controller: controller,
      decoration: InputDecoration(
        hintText: "$hinttext",
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: preIcon,
        suffixIcon: sufIcon,
        filled: true,
        fillColor: Color(0xffF0EEEB),
        contentPadding: contentPading,
        border: border,
      ),
      validator: validator,
    );
  }
}
