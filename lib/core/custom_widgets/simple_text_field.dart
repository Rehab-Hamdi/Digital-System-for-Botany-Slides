import 'package:flutter/material.dart';

class SimpleTextField extends StatelessWidget {
  TextEditingController controller;
  String? text;

  SimpleTextField({super.key, required this.text,required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(hintText: text),
      controller: controller,
    );
  }
}
