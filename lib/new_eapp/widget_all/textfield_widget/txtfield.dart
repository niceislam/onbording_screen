import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.hinttext,
    this.preIcon,
    this.sufIcon,
    this.controller,
    this.onchanged,
  });
  final String? hinttext;
  final Icon? preIcon;
  final InkWell? sufIcon;
  final TextEditingController? controller;
  final ValueChanged? onchanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onchanged,
      controller: controller,
      decoration: InputDecoration(
        hintText: "$hinttext",
        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
        prefixIcon: preIcon,
        suffixIcon: sufIcon,
        filled: true,
        fillColor: Color(0xffF0EEEB),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
