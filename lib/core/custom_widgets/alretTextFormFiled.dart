import 'package:flutter/material.dart';

class AlertTextFormField extends StatelessWidget {
  FocusNode focusNode;
  String? Function(String?)? validatorFunction;
  var controller;
  String label;
  var function;

  AlertTextFormField(
      {super.key,
      required this.focusNode,
      required this.controller,
      required this.validatorFunction,
      required this.label,
      this.function,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: null,
      onTap: () => function,
      focusNode: focusNode,
      controller: controller,
      validator: validatorFunction,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        label: Text(label),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(25.0),
        // ),
        // focusedBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(25.0),
        //     borderSide:const  BorderSide(
        //       color:MyColors.lightBlack,))
      ),
    );
  }
}
